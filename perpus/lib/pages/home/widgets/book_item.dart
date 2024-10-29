import 'package:flutter/material.dart';
import 'package:perpus/models/book.dart'; // Replace `your_project_name` with your actual project name
import 'package:perpus/pages/detail/detail.dart';

class BookItem extends StatelessWidget {
  final Book book;
  const BookItem(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DetailPage(book)),
      ),
      child: Container (
      height: 200, // Ensure height is a double
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/254-200x300.jpg'), // Use `NetworkImage` for URL
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
  }
}
