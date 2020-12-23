import 'package:flutter/cupertino.dart';
import 'package:json_server_app/app/shared/local/json_server_book.dart' as js;
import 'package:json_server_app/app/shared/local/json_server_book.dart';

import 'model/book.dart';

class AppController extends ChangeNotifier {
  List<Book> books;

  /// Atualiza a lista de [Book]s.
  setBooks(List<Book> books) {
    this.books = books;

    notifyListeners();
  }

  /// Adiciona um livro.
  addBook(Book book) async {
    await js.postBook(book: book).then((value) => book.id = value.toString());
    books.add(book);

    notifyListeners();
  }

  /// Atualiza um livro.
  updateBook(Book book) async {
    await js.putBook(book: book);
    books[getBookIndexById(id: book.id)].setValues(book: book);

    notifyListeners();
  }

  /// Remove um livro.
  deleteBook(Book book) async {
    await js.deleteBook(id: book.id);
    books.remove(book);

    notifyListeners();
  }

  /// Devolve um livro por id.
  getBookIndexById({String id}) {
    for (var i = 0; i < books.length; i++) {
      if (books[i].id == id) {
        return i;
      }
    }
    return -1;
  }

  /// Filtra os [Boo]s com uma dada string.
  filterBooks({String filter}) async {
    // Todos os livros
    if (filter == null || filter == '') {
      await getBooks().then((value) => setBooks(value));
    } else {
      final filteredBooks = <Book>[];
      await getBooks().then((value) => setBooks(value));
      for (var i = 0; i < books.length; i++) {
        if (books[i].title.toLowerCase().contains(filter.toLowerCase()) ||
            books[i].author.toLowerCase().contains(filter.toLowerCase()) ||
            books[i].isbn.toLowerCase().contains(filter.toLowerCase())) {
          filteredBooks.add(books[i]);
        }
      }
      setBooks(filteredBooks);
    }
  }
}
