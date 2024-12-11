import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:perpus/models/book.dart';

class GutenbergService {
  Future<List<Book>> searchBooks(String query) async {
    final url = Uri.https('gutendex.com', '/books', {
      'search': query,
    });
    try {
      print('Query URL: $url'); // Debug: Print the URL
      final response = await http.get(url).timeout(const Duration(seconds: 10)); // Adding timeout

      if (response.statusCode == 200) {
        print('Response: ${response.body}'); // Debug: Print the response
        final data = json.decode(response.body);
        final List<dynamic> items = data['results'];
        return items.map((json) => Book.fromJson(json)).toList();
      } else {
        print('Error response: ${response.body}'); // Debug: Print the error response
        throw Exception('Failed to load books: ${response.statusCode}');
      }
    } on TimeoutException catch (_) {
      throw Exception('Request timed out');
    } on Exception catch (e) {
      throw Exception('Failed to load books: $e');
    }
  }

  Future<List<Book>> getPopularBooks() async {
    final url = Uri.https('gutendex.com', '/books', {
      'sort': 'popular', // Query parameter for sorting by popularity
    });
    try {
      print('Query URL: $url'); // Debug: Print the URL
      final response = await http.get(url).timeout(const Duration(seconds: 10)); // Adding timeout

      if (response.statusCode == 200) {
        print('Response: ${response.body}'); // Debug: Print the response
        final data = json.decode(response.body);
        final List<dynamic> items = data['results'];
        for (var item in items) {
          print('Book Data: $item'); // Debug: Print each book data
        }
        return items.map((json) => Book.fromJson(json)).toList();
      } else {
        print('Error response: ${response.body}'); // Debug: Print the error response
        throw Exception('Failed to load books: ${response.statusCode}');
      }
    } on TimeoutException catch (_) {
      throw Exception('Request timed out');
    } on Exception catch (e) {
      throw Exception('Failed to load books: $e');
    }
  }
}
