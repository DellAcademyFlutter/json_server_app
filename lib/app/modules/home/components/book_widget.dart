import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:json_server_app/app/modules/crud_book/crud_book_page.dart';

import '../../../app_controller.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({
    Key key,
    @required this.appController,
    @required this.index,
  }) : super(key: key);

  final AppController appController;
  final index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
            child: ListTile(
              title: Text(
                appController.books[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: ListTile(
                title: Text(
                  'Autor: ${appController.books[index].author}',
                ),
                subtitle: Text('ISBN: ${appController.books[index].isbn}'),
              ),
              trailing: Text('id: ${appController.books[index].id}'),
            )),
      ),
      actions: <Widget>[
        EditWidget(
          appController: appController,
          index: index,
        ),
        RemoveWidget(
          appController: appController,
          index: index,
        ),
      ],
    );
  }
}

class RemoveWidget extends StatelessWidget {
  const RemoveWidget({
    Key key,
    @required this.appController,
    @required this.index,
  }) : super(key: key);

  final AppController appController;
  final index;

  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
      caption: 'Excluir',
      color: Colors.red,
      icon: Icons.delete,
      onTap: () async {
        final bookName = appController.books[index].title;
        appController.deleteBook(appController.books[index]);
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Atenção!"),
                content: Text("livro ${bookName} foi deletado com sucesso!"),
                actions: [
                  FlatButton(
                    child: Text("Ok!"),
                    onPressed: () {
                      Modular.to.pop();
                    },
                  ),
                ],
              );
            });
      },
    );
  }
}

class EditWidget extends StatelessWidget {
  const EditWidget(
      {Key key, @required this.appController, @required this.index})
      : super(key: key);

  final AppController appController;
  final index;

  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
      caption: 'Editar',
      color: Colors.green,
      icon: Icons.edit,
      onTap: () {
        Modular.to.pushNamed(CrudBookPage.routeName,
            arguments: CrudBookPageArguments(book: appController.books[index]));
      },
    );
  }
}
