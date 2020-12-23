import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_server_app/app/model/book.dart';
import 'package:json_server_app/app/modules/crud_book/crud_book_controller.dart';

class CrudBookPageArguments {
  CrudBookPageArguments({this.book});

  final Book book;
}

class CrudBookPage extends StatefulWidget {
  static const routeName = "/crudBook";

  CrudBookPage({this.book});
  final Book book;

  @override
  _CrudBookPageState createState() => _CrudBookPageState();
}

class _CrudBookPageState extends State<CrudBookPage> {
  final controller = Modular.get<CrudBookController>();

  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController isbnController = TextEditingController();

  String title;
  String author;
  String isbn;

  @override
  void initState() {
    titleController.text = widget.book != null ? widget.book.title : "";
    authorController.text = widget.book != null ? widget.book.author : "";
    isbnController.text = widget.book != null ? widget.book.isbn : "";
    title = titleController.text;
    author = authorController.text;
    isbn = isbnController.text;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('CRUD book'),
            Spacer(),
            IconButton(
              icon: Icon(Icons.save),
              tooltip: 'Salvar postit',
              onPressed: () {
                controller.saveBook(
                  id: widget.book != null ? widget.book.id : null,
                  title: title,
                  author: author,
                  isbn: isbn,
                  book: widget.book,
                );
                Modular.to.pop();
              },
            ),
          ],
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: titleController,
                  onChanged: (valor) => setState(() => title = valor),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insira o título do seu livro',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: authorController,
                  onChanged: (valor) => setState(() => author = valor),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insira o autor do seu livro',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: isbnController,
                  onChanged: (valor) => setState(() => isbn = valor),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Insira o isbn do seu livro',
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
