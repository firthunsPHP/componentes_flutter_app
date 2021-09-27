import 'package:flutter/material.dart';

// los creados
// import 'package:componentes_flutter_app/src/pages/home_temp.dart';
import 'package:componentes_flutter_app/src/pages/home_page.dart';


// snippets -> mateapp + tab
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes APP',
      debugShowCheckedModeBanner: false,
      home: HomePage(),


    );
  }
}
