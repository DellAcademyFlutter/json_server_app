import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_server_app/app/modules/crud_book/crud_book_page.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/crud_book/crud_book_module.dart';
import 'modules/home/home_module.dart';
import 'modules/home/home_page.dart';

class AppModule extends MainModule {
  @override
  // Lista de injecoes de independencia do projeto
  List<Bind> get binds => [
    Bind((i) => AppController()),
  ];

  @override
  // Root Widget
  Widget get bootstrap => AppWidget();

  @override
  // Modulos associados a este aplicativo
  List<ModularRouter> get routers => [
    ModularRouter(HomePage.routeName, module: HomeModule()),
    ModularRouter(CrudBookPage.routeName, module: CrudBookModule()),
  ];
}