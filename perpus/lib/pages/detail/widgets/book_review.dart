import 'package:flutter/cupertino.dart';
import 'package:perpus/models/book.dart';
import 'package:flutter/material.dart';

class BookReview extends StatelessWidget{
  final Book book;
  const BookReview(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: book.review,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    height: 1.0,
                  ),
                ),const TextSpan(
                text: 'Read More',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}