//مضر جورية

class Book {
  int? id;
  final String title;
  final String author;
  final String descripation;
  final String category;
  final int numbersOfBooks;
  final double price;
  Book(
      {this.id,
      required this.title,
      required this.author,
      required this.descripation,
      required this.category,
      required this.numbersOfBooks,
      required this.price});
}
