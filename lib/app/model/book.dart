class Book {
  String id;
  String title;
  String author;
  String isbn;

  Book({this.id, this.title, this.author, this.isbn});

  /// Atribui os valores deste [Book].
  setValues({Book book}) {
    id = book.id;
    title = book.title;
    author = book.author;
    isbn = book.isbn;
  }

  /// Instancia um [Book] a partir de um [Map].
  factory Book.fromJson(Map<String, dynamic> map) {
    return Book(
        id: map['id'].toString(),
        title: map['title'].toString(),
        author: map['author'].toString(),
        isbn: map['isbn'].toString());
  }

  /// Converte este [Book] para formato [Map].
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['author'] = author;
    data['isbn'] = isbn;
    return data;
  }
}
