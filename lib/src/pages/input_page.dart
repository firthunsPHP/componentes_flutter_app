import 'package:flutter/material.dart';



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email  = '';
  String _fecha  = '';

  final String _opcionSeleccionada = 'Volar';

  final List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
// me permite controlar el valor de la fecha
  final TextEditingController _inputFieldDateController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs de texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          const Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
          Divider(),

        ],
      ),
    );
  }


  /// primer Método
  /// https://flutter.dev/docs/cookbook/forms/text-input
  /// https://api.flutter.dev/flutter/material/InputBorder-class.html
  Widget _crearInput() {

    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0)
        ),
        counter: Text('Letras ${ _nombre.length }'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Sólo es el nombre',
        suffixIcon: const Icon( Icons.accessibility ),
        icon: const Icon( Icons.account_circle )
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );

  }
  /// 3.
  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: const Icon( Icons.alternate_email ),
        icon: const Icon( Icons.email )
      ),
      onChanged: (valor) =>setState(() {
        _email = valor;
      })
    );

  }
  /// 4.
  Widget _crearPassword(){

     return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon( Icons.lock_open ),
        icon: Icon( Icons.lock )
      ),
      onChanged: (valor) =>setState(() {
        _email = valor;
      })
    );

  }
  //
/// 5.
  /// https://api.flutter.dev/flutter/dart-core/DateTime-class.html
  Widget _crearFecha( BuildContext context ) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: const Icon( Icons.perm_contact_calendar ),
          icon: const Icon( Icons.calendar_today )
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );

      },
    );

  }



  /// 6.
  /// https://flutter.dev/docs/null-safety
  /// https://flutter.dev/docs/development/accessibility-and-localization/internationalization


   _selectDate(BuildContext context) async {

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate:  DateTime(2018),
      lastDate:  DateTime(2025),
      locale: const Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
          _fecha = picked.toString();
          _inputFieldDateController.text = _fecha;
      });
    }

  }



  /// 7. https://api.flutter.dev/flutter/material/DropdownButton-class.html
  Widget _crearDropdown() {


    return DropdownButton<dynamic>(
        items:getOpcionesDrop(),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
         onChanged:  (opt){
          print(opt);
      },

    );

  }
  List<DropdownMenuItem<String>> getOpcionesDrop() {

    //si usan = new List(); dara error, reeemplazenlo solo por un arreglo vació
    //y eso debería de solucionar su problema
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder){

      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }


  // 2.
  Widget _crearPersona() {

    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );

  }




}