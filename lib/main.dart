
/* -----------------
    Uso de Focus.  
    GACC 201912181806
   ----------------- */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Text Field Focus',
            home: MyCustomForm(),
        );
    }
}

//Define un widget de formulario personalizado
class MyCustomForm extends StatefulWidget{
    @override
    _MyCustomFormState createState() => _MyCustomFormState();
}

//Define una clase State corrspondiente. Esta clase contendrá los datos relacionados con el formulario.
class _MyCustomFormState extends State<MyCustomForm>{
    //Define el focus mode. Para administrar el ciclo de vida, crea el FocusNode en el método initState y limpia en el método dispose
    FocusNode myFocusNode;
    @override
    void initState(){
        super.initState();

        myFocusNode = FocusNode();
    }
    @override
    void dispose(){
        //Limpia el nodo focus cuando se haga dispose al formulario
        myFocusNode.dispose();
        super.dispose();
    }
    @override
    Widget build(BuildContext context){
        return Scaffold(
         appBar: AppBar(
             title: Text('Text Field Focus'),
         ),
         body: Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
                 children: [
                     //El primer campo de texto se enfocará tan pronto como se inicie la aplicación
                     TextField(
                         autofocus: true,
                     ),
                     //El segundo campo de texto se enfocará cuando un usuario pulse el FloatingActionButton
                     TextField(
                         focusNode: myFocusNode,
                     ),
                 ],
             ),
         ),
            floatingActionButton: FloatingActionButton(
                //Cuando el botón es pulsado, pide a Flutter que haga focus sobre nuestro campo de texto usando myFocusNode.
                onPressed: () => FocusScope.of(context).requestFocus(myFocusNode),
                tooltip: 'Focus Second Text Field',
                child: Icon(Icons.edit),
                //Esta coma final hace que el auto-formatting sea más agradable para los métodos build
            ),
        );
    }
}













