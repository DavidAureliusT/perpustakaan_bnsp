import 'dart:async';

import 'package:book_repository/book_repository.dart';
import 'package:service_provider/service_provider.dart';

class BookRepository {
  List<Book> _books = [];

  final ServiceProvider serviceProvider = ServiceProvider();

  final _booksStreamController = StreamController<List<Book>>();

  Stream<List<Book>> get session async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield _books;
    yield* _booksStreamController.stream;
  }
}
