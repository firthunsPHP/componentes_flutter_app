
import 'package:flutter/material.dart';

// los creados
import 'package:componentes_flutter_app/src/routes/routes.dart';
import 'package:componentes_flutter_app/src/pages/alert_page.dart';
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
      routes: getApplicationRoutes(),
      onGenerateRoute: ( settings ){

        print('ruta llamada: ${settings.name}' );

        return MaterialPageRoute(
          builder: ( BuildContext context) =>AlertPage()
        );
      },
    );
  }
}
