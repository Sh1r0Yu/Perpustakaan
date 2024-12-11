class Book {
  final String title;
  final String authors;
  final String description;
  final String thumbnail;
  final String publisher;
  final String date;
  final String review;
  final String previewLink; // Tambahkan preview link

  Book({
    required this.title,
    required this.authors,
    required this.description,
    required this.thumbnail,
    required this.publisher,
    required this.date,
    required this.review,
    required this.previewLink,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['volumeInfo']['title'] ?? 'No Title',
      authors: (json['volumeInfo']['authors'] as List<dynamic>?)?.join(', ') ?? 'No Authors',
      description: json['volumeInfo']['description'] ?? 'No Description',
      thumbnail: json['volumeInfo']['imageLinks'] != null
          ? json['volumeInfo']['imageLinks']['thumbnail']
          : 'https://via.placeholder.com/150',
      publisher: json['volumeInfo']['publisher'] ?? 'Unknown Publisher',
      date: json['volumeInfo']['publishedDate'] ?? 'Unknown Date',
      review: json['volumeInfo']['averageRating'] != null
          ? 'Average Rating: ${json['volumeInfo']['averageRating']}'
          : 'No Reviews',
      previewLink: json['volumeInfo']['previewLink'] ?? '',
    );
  }
}
