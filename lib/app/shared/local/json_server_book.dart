import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_server_app/app/model/book.dart';
import 'package:json_server_app/app/utils/consts.dart';

// Watch command: json-server --watch livros.json
// json-server --watch --host 0.0.0.0  livros.json

/// Metodo GET
Future<Book> getBook({id}) async {
  final response = await http.get("$URL_BASE/$id");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Book.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Book');
  }
}

/// GET todos os livros
Future<List<Book>> getBooks() async {
  final response = await http.get(URL_BASE);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    final jsonResponse = jsonDecode(response.body);
    final books =
        (jsonResponse as List).map((data) => Book.fromJson(data)).toList();
    return books;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Book');
  }
}

/// Metodo POST
Future<int> postBook({Book book}) async {
  // Cabecalho de um post
  final headers = <String, String>{
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  final body = jsonEncode(book.toJson());

  final response = await http.post(URL_BASE, body: body, headers: headers);
  final jsonResponse = jsonDecode(response.body);

  return jsonResponse['id'];
}

/// Metodo PUT
Future<Book> putBook({Book book}) async {
  final response = await http.put(
    '$URL_BASE/${book.id}',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(book.toJson()),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 UPDATED response,
    // then parse the JSON.
    return Book.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 UPDATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

/// Metodo Delete
Future<http.Response> deleteBook({String id}) async {
  final response = await http.delete(
    '$URL_BASE/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return response;
}
