


import 'package:flutter/material.dart';

// los creados
// import 'package:componentes_flutter_app/src/pages/home_temp.dart';
import 'package:componentes_flutter_app/src/pages/home_page.dart';
import 'package:componentes_flutter_app/src/pages/alert_page.dart';
import 'package:componentes_flutter_app/src/pages/avatar_page.dart';
// snippets -> mateapp + tab
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes APP',
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': ( BuildContext context) => HomePage(),
        'alert': ( BuildContext context) => AlertPage(),
        'avatar': ( BuildContext context) => AvatarPage(),
      },

    );
  }
}
