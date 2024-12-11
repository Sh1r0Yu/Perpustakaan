import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:perpus/models/book.dart';

class OpenLibraryService {
  Future<List<Book>> fetchBooks(String query) async {
    final url = Uri.https('openlibrary.org', '/search.json', {'q': query});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final books = (data['docs'] as List)
          .map((doc) => Book.fromJson(doc))
          .toList();
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }
}
