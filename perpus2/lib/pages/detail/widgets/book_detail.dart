import 'package:flutter/material.dart';
import 'package:perpus2/models/book.dart'; // Pastikan BookCover diimpor
import 'package:perpus2/pages/detail/widgets/book_cover.dart';
import 'package:url_launcher/url_launcher.dart'; // Impor untuk url_launcher
import 'package:intl/intl.dart';

class BookDetail extends StatelessWidget {
  final Book book;

  const BookDetail({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate;
    try {
      formattedDate = DateFormat.yMMMd().format(DateTime.parse(book.date));
    } catch (e) {
      formattedDate = 'Unknown Date';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Detail'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookCover(book: book), // Gunakan widget BookCover
            const SizedBox(height: 20),
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Authors: ${book.authors}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Published by ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextSpan(
                        text: book.publisher,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              book.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Reviews',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              book.review,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (book.previewLink.isNotEmpty) {
                  _launchUrl(book.previewLink); // Fungsi untuk meluncurkan preview link
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No preview available')),
                  );
                }
              },
              child: const Text('Read Preview'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
