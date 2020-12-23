import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_server_app/app/modules/crud_book/crud_book_page.dart';
import 'package:json_server_app/app/modules/home/home_controller.dart';

import '../../app_controller.dart';
import 'components/book_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appController = Modular.get<AppController>();
  final homeController = Modular.get<HomeController>();
  TextEditingController filterController = TextEditingController();
  String filter;

  @override
  void initState() {
    homeController.initializeBooks();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Server com livros'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: filterController,
              onChanged: (valor) => setState(() {
                filter = valor;
                appController.filterBooks(filter: filter);
              }),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.search),
                labelText: 'Pesquisar',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: Container(
                  child: Consumer<AppController>(builder: (context, value) {
                return appController.books != null
                    ? ListView.builder(
                        itemCount: appController.books.length,
                        itemBuilder: (context, index) {
                          return BookWidget(
                              appController: appController, index: index);
                        },
                      )
                    : Center(child: CircularProgressIndicator());
              })),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Modular.to.pushNamed(CrudBookPage.routeName,
              arguments: CrudBookPageArguments(book: null));
        },
      ),
    );
  }
}
