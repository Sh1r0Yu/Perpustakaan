import 'package:flutter/material.dart';
import 'package:perpus/constants/colors.dart';
import 'package:perpus/models/book.dart';
import 'package:perpus/pages/detail/widgets/book_cover.dart';
import 'package:perpus/pages/detail/widgets/book_detail.dart';
import 'package:perpus/pages/detail/widgets/book_review.dart';

class DetailPage extends StatelessWidget{
  final Book book;
  const DetailPage (this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookDetail(book),
            BookCover(book),
            BookReview(book),
          ],
        ),
      )
    );
  }
  AppBar _buildAppBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(), 
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {}, 
          icon: const Icon(
            Icons.more_horiz_outlined,
            color: Colors.black,))
      ],
    );
  }
}