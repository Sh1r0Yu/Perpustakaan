import 'package:flutter/material.dart';
import 'package:perpus/models/book.dart';

class BookItem extends StatelessWidget {
  final Book book;
  final VoidCallback onFavoriteToggle;
  final bool isFavorite;
  final VoidCallback onTap;

  const BookItem({
    required this.book,
    required this.onFavoriteToggle,
    required this.isFavorite,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(book.thumbnail),
                fit: BoxFit.cover,
                onError: (error, stackTrace) => Image.asset(
                  'assets/images/placeholder.png', // Placeholder image in case of error
                  fit: BoxFit.cover,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
                onPressed: onFavoriteToggle,
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              book.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                backgroundColor: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
