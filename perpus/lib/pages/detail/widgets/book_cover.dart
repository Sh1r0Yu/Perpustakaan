import 'package:flutter/material.dart';
import 'package:perpus/models/book.dart';

class BookCover extends StatelessWidget {
  final Book book;

  const BookCover({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(book.thumbnail),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            // Handle image load error
            print('Failed to load image');
          },
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: book.thumbnail.isEmpty 
        ? const Center(child: Text('No Image Available'))
        : null,
    );
  }
}
