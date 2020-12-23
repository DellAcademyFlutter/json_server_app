import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_server_app/app/model/book.dart';

import '../../app_controller.dart';

class CrudBookController {
  saveBook({String id, String title, String author, String isbn, Book book}) async {
    final appController = Modular.get<AppController>();

    final newBook = Book(
      id: book?.id,
      title: title,
      author: author,
      isbn: isbn,
    );

    book != null
        ? await appController.updateBook(newBook)
        : await appController.addBook(newBook);
  }
}
