
import 'package:flutter/material.dart';
// https://flutter.dev/docs/development/accessibility-and-localization/internationalization
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
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
