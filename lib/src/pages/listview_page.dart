import 'package:flutter/material.dart';

import 'dart:async';

/// https://pub.dev/documentation/flutter_paginator/latest/
class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  final ScrollController _scrollController =  ScrollController();

  final List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
    // se va a diisparar cada vez que se mueva el scroll
    //   print('SCROLL!!!!.......');
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        _agregar10();
        fetchData();
      }

    });

  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
            _crearLista(),
            _crearLoading()
        ],
      )
      
      
    );
  }

  /// 1.
  Widget _crearLista() {

    /** el metodo RefreshIndicator sale de de selleccionar ListvIEW.BUILDER Y CON EL BOTON DEL RATON
     * SELECCIONA LA PROPIEDAD 'Wrap with new widget '**/
    return RefreshIndicator(

        onRefresh: obtenerPagina1,

        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index ){

          final imagen = _listaNumeros[index];

          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );

  }
/// pull to refresh
  Future<void> obtenerPagina1() async {

    const duration =   Duration( seconds: 2 );
     Timer( duration, () {

      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();

    });

    return Future.delayed(duration);

  }


/// 2. infiniti scroll
  void _agregar10() {

    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add( _ultimoItem );
    }

    setState(() {});

  }


/// INIFITE SCROLL CON FUTURES
 Future fetchData() async {

    _isLoading = true;
    setState(() {});

    const duration =   Duration( seconds: 2 );
    return  Timer( duration, respuestaHTTP );

  }
  /// INIFITE SCROLL CON FUTURES
  void respuestaHTTP() {

    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration( milliseconds: 250)
    );
    _agregar10();

  }

  Widget _crearLoading() {

    if ( _isLoading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator()
            ],
          ),
          const SizedBox( height: 15.0)
        ],
      );
      
      
      
    } else {
      return Container();
    }

  }

}

