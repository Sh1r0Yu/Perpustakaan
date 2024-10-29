import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:perpus/models/book.dart';

import 'book_item.dart';

class BookStaggeredGridView extends StatelessWidget {
  final int selected;
  final PageController pageController;
  final Function callback;

  BookStaggeredGridView(this.selected, this.pageController, this.callback, {super.key});

  final bookList = Book.generateBooks();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: [
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            itemCount: bookList.length,
            itemBuilder: (context, index) {
              return BookItem(bookList[index]);
            },
          ),
          Container(),
        ],
      ),
    );
  }
}
