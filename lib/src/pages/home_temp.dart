import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {

  final opciones = ['uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  // https://api.flutter.dev/flutter/widgets/ListView-class.html


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Componentes Temp'),
        ),
      body: ListView(
        // children:  _crearItems()
        children: _crearItemsCorta(),
         ),
    );
  }


  List<Widget> _crearItems(){

    List<Widget> lista = <Widget>[];

      for ( String opt in opciones){

        final tempWidget = ListTile(
          title: Text( opt),

        );
        // https://api.flutter.dev/flutter/material/Divider-class.html
        // operador de cascada

        lista..add( tempWidget )
             ..add ( Divider(color: Colors.deepOrange) );


      }

    return lista;
  }


  List<Widget> _crearItemsCorta(){

 return opciones.map(  (item ) {
      // tips!!, sobre ListTile, boton raton 'show context action' > 'wrap with column'
   /**
    *       return ListTile(
       title: Text( item + '!'),
       );
       }).toList();
    */
   return Column(
     children: [
       ListTile(
            title: Text( item + '!'),
         subtitle: Text('Cualquier cosa'),
         leading: Icon( Icons.account_balance_wallet),
         trailing: Icon ( Icons.keyboard_arrow_right ),
         onTap: (){ }
            ),
       Divider(color: Colors.deepOrange)
     ],
   );
    }).toList();


  }










}