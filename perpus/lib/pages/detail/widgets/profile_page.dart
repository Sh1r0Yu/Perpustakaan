import 'package:flutter/material.dart';
import 'package:perpus/pages/login/login.dart';
import 'package:perpus/pages/home/home.dart';
import 'package:perpus/pages/detail/widgets/favorite_page.dart';
import 'package:perpus/models/book.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController nameController;
  late TextEditingController birthdateController;
  String name = 'John Doe';
  String email = 'johndoe@example.com';
  String birthdate = 'January 1, 1990';
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: name);
    birthdateController = TextEditingController(text: birthdate);
  }

  @override
  void dispose() {
    nameController.dispose();
    birthdateController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _saveProfile() {
    if (nameController.text.isEmpty || birthdateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fields cannot be empty')),
      );
    } else {
      setState(() {
        name = nameController.text;
        birthdate = birthdateController.text;
        isEditing = false;
      });
    }
  }

  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }

  void _navigateToFavorites(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const FavoritePage(favoriteBooks: [])), // Add actual favoriteBooks list
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: isEditing ? _saveProfile : _toggleEdit,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
              ),
              const SizedBox(height: 20),
              isEditing
                  ? TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    )
                  : Text(
                      name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
              const SizedBox(height: 10),
              Text(email),
              const SizedBox(height: 10),
              isEditing
                  ? TextField(
                      controller: birthdateController,
                      decoration: const InputDecoration(labelText: 'Birthdate'),
                    )
                  : Text('Birthdate: $birthdate'),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Index of this page
        onTap: (index) {
          if (index == 0) {
            _navigateToHome(context);
          } else if (index == 1) {
            _navigateToFavorites(context);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
