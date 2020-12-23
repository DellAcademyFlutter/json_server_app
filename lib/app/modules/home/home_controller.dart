import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_server_app/app/app_controller.dart';
import 'package:json_server_app/app/shared/local/json_server_book.dart';

class HomeController {
  /// Inicializa os [Book]s com o arquivo do json server.
  initializeBooks() async {
    final appController = Modular.get<AppController>();

    await getBooks().then((value) => appController.setBooks(value));
  }
}
