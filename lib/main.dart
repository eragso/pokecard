import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:pokecard/login.dart';
import 'package:pokecard/main2.dart';
import 'package:pokecard/class_builder.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
 }

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent
    ));

    //Carga de la pagina login con declaracion del menu(main2), para ejecutar
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pokecard',
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context ) => AuthThreePage(),
        'menu' : (BuildContext context ) => MainWidget(),
      },
    );
  }

}