import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_page.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          title: "My Anoteds",
          initialRoute: HomePage.routeName,
          navigatorKey: Modular.navigatorKey,
          onGenerateRoute: Modular.generateRoute,
          debugShowCheckedModeBanner: false,
        );
  }
}
