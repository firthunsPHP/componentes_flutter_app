

import 'package:flutter/material.dart';

import 'package:componentes_flutter_app/src/providers/menu_provider.dart';


// tips: stless + tab

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){

    // https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html

    return FutureBuilder(
      future: menuProvider.cargarData(),
      // initialData: [],
      builder: (BuildContext  context, AsyncSnapshot<List<dynamic>> snapshot ){

        print('Builder');
        print( snapshot.data);

        return ListView(
          children: _listaItems( snapshot.data )
        );

      },
    );




    // return ListView(
    //   children: _listaItems()
    // );

  }

  /// Hasta ésta función hemos conseguido lop siguiente:
  /// 1. hemos hecho to.do el ciclo de leer un archivo .json
  /// 2. proveer esa información
  /// 3. usar el fichero builder y mostrarlo en pantalla
  /// **/
  List<Widget> _listaItems( List<dynamic>? data){

    final List<Widget> opciones = [];
    if (data != null) {
      data.forEach((opt) {
        final widgetTemp = ListTile(
          title: Text(opt['texto']),
          leading: Icon(Icons.account_circle, color: Colors.blue),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {},
        );
        //
        opciones..add(widgetTemp)..add(Divider());
      });
    }
    return opciones;
  }


}
