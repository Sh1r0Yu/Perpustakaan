import 'package:flutter/material.dart';
import 'package:perpus2/models/book.dart';

class BookReview extends StatelessWidget {
  final Book book;
  const BookReview(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Title
          Semantics(
            label: 'Book Title',
            child: Text(
              book.title.isNotEmpty ? book.title : 'No Title Available',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 15),

          // Authors
          Semantics(
            label: 'Authors',
            child: Text(
              book.authors.isNotEmpty ? book.authors : 'No Authors Available',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Book Review Text
          Semantics(
            label: 'Description',
            child: Text(
              book.description.isNotEmpty ? book.description : 'No Description Available',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
