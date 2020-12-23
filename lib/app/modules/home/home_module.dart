import 'package:flutter_modular/flutter_modular.dart';
import 'package:json_server_app/app/app_controller.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  // Injecoes de dependencia
  List<Bind> get binds => [
        Bind((i) => HomeController()),
    Bind((i) => AppController()),
      ];

  @override
  // Rotas
  List<ModularRouter> get routers => [
        ModularRouter<String>(
          HomePage.routeName,
          child: (_, args) => HomePage(),
          transition: TransitionType.leftToRight,
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
