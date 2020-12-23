import 'package:flutter_modular/flutter_modular.dart';

import 'crud_book_controller.dart';
import 'crud_book_page.dart';

class CrudBookModule extends ChildModule {
  @override
  // Injecoes de dependencia
  List<Bind> get binds => [
        Bind((i) => CrudBookController()),
      ];

  @override
  // Rotas
  List<ModularRouter> get routers => [
        ModularRouter<String>(
          CrudBookPage.routeName,
          child: (_, args) => CrudBookPage(
            book: args.data.book,
          ),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Inject get to => Inject<CrudBookModule>.of();
}
