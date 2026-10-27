import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:perpus2/models/book.dart';

class GoogleBooksService {
  final String apiKey = const String.fromEnvironment('GOOGLE_BOOKS_API_KEY');

  Future<List<Book>> getPopularBooks() async {
    final response = await http.get(
      Uri.parse('https://www.googleapis.com/books/v1/volumes?q=bestsellers&key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> booksJson = data['items'];
      return booksJson.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load popular books');
    }
  }

  Future<List<Book>> searchBooks(String query) async {
    final response = await http.get(
      Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query&key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> booksJson = data['items'];
      return booksJson.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search books');
    }
  }
}
