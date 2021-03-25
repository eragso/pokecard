import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pokecard/Splash/animation_screen.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),

      routes: {
        'login' : (BuildContext context ) => AuthThreePage(),
        'menu' : (BuildContext context ) => MainWidget(),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Scaffold(
            body: AuthThreePage()
          ),
          
          IgnorePointer(
            child: AnimationScreen(
              color: Theme.of(context).accentColor
            )
          )
        ]
      )
    );
  }
}