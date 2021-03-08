import 'package:pokecard/home.dart';
import 'package:pokecard/login.dart';
import 'package:pokecard/mazo.dart';
import 'package:pokecard/subecartas.dart';

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
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
