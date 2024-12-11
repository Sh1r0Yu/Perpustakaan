import 'package:flutter/material.dart';
import 'package:perpus/models/book.dart';
import 'package:perpus/pages/detail/widgets/book_detail.dart';
import 'package:perpus/pages/detail/widgets/favorite_page.dart';
import 'package:perpus/pages/detail/widgets/profile_page.dart';
import 'package:perpus/pages/home/widgets/book_item.dart';
import 'package:perpus/services/google_books_services.dart'; // Ensure this is correct

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Book> bookList = [];
  List<Book> favoriteBooks = [];
  List<Book> filteredBooks = [];
  TextEditingController searchController = TextEditingController();
  int bottomIndex = 0;
  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterBooks);
    _fetchPopularBooks(); // Fetch popular books on init
  }

  void _filterBooks() {
    if (searchController.text.isEmpty) {
      setState(() {
        filteredBooks = bookList;
      });
    } else {
      _searchBooks(searchController.text);
    }
  }

  Future<void> _fetchPopularBooks() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final books = await GoogleBooksService().getPopularBooks();
      setState(() {
        bookList = books;
        filteredBooks = books;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _searchBooks(String query) async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final books = await GoogleBooksService().searchBooks(query); // Ensure this method exists
      setState(() {
        if (books.isEmpty) {
          errorMessage = 'No books found for the search query: $query';
        } else {
          filteredBooks = books;
        }
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void toggleFavorite(Book book) {
    setState(() {
      if (favoriteBooks.contains(book)) {
        favoriteBooks.remove(book);
      } else {
        favoriteBooks.add(book);
      }
    });
  }

  Widget _buildBottomNavigationBar() {
    final icons = [
      Icons.home_outlined,
      Icons.bookmark_border_outlined,
      Icons.person_outlined,
    ];
    final labels = [
      'Home',
      'Favorites',
      'Profile',
    ];

    return BottomNavigationBar(
      currentIndex: bottomIndex,
      onTap: (index) {
        setState(() {
          bottomIndex = index;
        });
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritePage(favoriteBooks: favoriteBooks),
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        }
      },
      items: List.generate(icons.length, (index) {
        return BottomNavigationBarItem(
          icon: Icon(icons[index]),
          label: labels[index],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LIBERIS',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search Books...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            if (isLoading)
              const Center(child: CircularProgressIndicator()),
            if (errorMessage.isNotEmpty)
              Center(child: Text(errorMessage)),
            GridView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true, // Prevent scroll conflict
              physics: const NeverScrollableScrollPhysics(), // Use parent scroll
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return BookItem(
                  book: filteredBooks[index],
                  onFavoriteToggle: () => toggleFavorite(filteredBooks[index]),
                  isFavorite: favoriteBooks.contains(filteredBooks[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetail(book: filteredBooks[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
