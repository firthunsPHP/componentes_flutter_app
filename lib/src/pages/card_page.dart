import 'package:flutter/material.dart';


class CardPage extends StatelessWidget{

  @override
  Widget build (BuildContext context){

    return Scaffold(
      appBar: AppBar(  title: const Text('Cards ....')    ),
      body:  ListView(
        padding:  EdgeInsets.all(15),
        // padding:  EdgeInsets.symmetric(horizontal: 10.0,  vertical: 10.0),
        children: <Widget>[
          _cardTipo1()
        ],
      ) ,
    );
  }


  Widget _cardTipo1(){

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album, color: Colors.blue  ,),
            title: Text('The Enchanted Nightingale'),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),

      );
}

}