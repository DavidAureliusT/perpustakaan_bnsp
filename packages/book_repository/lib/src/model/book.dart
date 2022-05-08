import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int book_id;
  final String title;
  final String author;
  final double rating;
  final int total_pages;
  final int isbn;
  final String publisher;

  const Book({
    required this.book_id,
    required this.title,
    required this.author,
    required this.rating,
    required this.total_pages,
    required this.isbn,
    required this.publisher,
  });

  static Book fromJson(Map<String, dynamic> json) => Book(
        book_id: json['book_id'],
        title: json['title'],
        author: json['author'],
        rating: json['rating'],
        total_pages: json['total_pages'],
        isbn: json['isbn'],
        publisher: json['publisher'],
      );

  static const empty = Book(
    book_id: 99,
    title: "-",
    author: "-",
    rating: 0.0,
    total_pages: 0,
    isbn: 0,
    publisher: "-",
  );

  @override
  List<Object?> get props => [
        book_id,
        title,
        author,
        rating,
        total_pages,
        isbn,
        publisher,
      ];
}
