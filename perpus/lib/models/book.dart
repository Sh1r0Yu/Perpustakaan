class Book {
  String type;
  String name;
  String publisher;
  DateTime date;
  String imgUrl;
  num height;
  String review;

  Book(
    this.type,
    this.name,
    this.publisher,
    this.date,
    this.imgUrl,
    this.height,
    this.review,
  );

  static List<Book> generateBooks() {
    return [
      Book(
        'Fiction',
        'The Great Gatsby',
        'Scribner',
        DateTime(1925, 4, 10),
        'assets/images/254-200x300.jpg',
        1.5,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris finibus, massa at porttitor viverra, velit odio malesuada magna, lobortis elementum.',
      ),
      Book(
        'Non-Fiction',
        'Sapiens: A Brief History of Humankind',
        'Harper',
        DateTime(2011, 9, 4),
        'assets/images/254-200x300.jpg',
        2.0,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris finibus, massa at porttitor viverra, velit odio malesuada magna, lobortis elementum.'
      ),
      Book(
        'Science Fiction',
        'Dune',
        'Chilton Books',
        DateTime(1965, 8, 1),
        'assets/images/254-200x300.jpg',
        1.8,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris finibus, massa at porttitor viverra, velit odio malesuada magna, lobortis elementum.',
      ),
    ];
  }
}
