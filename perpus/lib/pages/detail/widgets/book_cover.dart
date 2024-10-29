import 'package:flutter/material.dart';
import 'package:perpus/models/book.dart';

class BookCover extends StatelessWidget {
  final Book book;
  const BookCover(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.only(left: 60),
      height: 250,
      child: Row(
        children: [
          // The gray container (book background)
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                color: Colors.grey,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                child: Image.asset(
                  book.imgUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
