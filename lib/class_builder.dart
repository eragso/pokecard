import 'package:pokecard/home.dart';
import 'package:pokecard/login.dart';
import 'package:pokecard/mazo.dart';
import 'package:pokecard/subecartas.dart';
import 'package:pokecard/subecartasmenu.dart';
import 'package:pokecard/settings.dart';
import 'package:pokecard/cartas.dart';
import 'package:pokecard/api/apihome2.dart';
import 'package:pokecard/Maps/mapa.dart';
import 'package:pokecard/QR/qrdefinitivo.dart';
import 'package:pokecard/main2.dart';
import 'package:pokecard/actualizaciones.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

//Registros de paginas para usar en el menu lateral (main2)
class ClassBuilder {
  static void registerClasses() {
    register<Home>(() => Home());
    register<AuthThreePage>(() => AuthThreePage());
    register<Mazo>(() => Mazo());
    register<SubeCartas>(() => SubeCartas());
    register<SubeCartasMenu>(() => SubeCartasMenu());
    register<Settings>(() => Settings());
    register<Cartas>(() => Cartas());
    register<Api>(() => Api());
    register<qrdefinitivo>(() => qrdefinitivo());
    register<mapa>(() => mapa());
    register<MainWidget>(() => MainWidget()); 
    register<Actualizaciones>(() => Actualizaciones());   

  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
