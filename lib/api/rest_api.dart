import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:pokecard/api/usuario_model.dart';

class URLS {
  static const String BASE_URL = 'http://estanteriaserver.ddns.net/api';
}

class ApiService {
  static Future<List<dynamic>> getCartas() async {
    // RESPONSE JSON :
    // [{
    //   "id": "1",
    //   "employee_name": "",
    //   "employee_salary": "0",
    //   "employee_age": "0",
    //   "profile_image": ""
    // }]
    final response = await http.get('${URLS.BASE_URL}/Cartas');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> addCartas(body) async {
    // BODY
    // {
    //   "name": "test",
    //   "age": "23"
    // }
    final response = await http.post('${URLS.BASE_URL}/Cartas', body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<dynamic>> getUsuario() async {
    final response = await http.get('${URLS.BASE_URL}/Usuario');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> addUsuario(body) async {
    final response = await http.post('${URLS.BASE_URL}/Usuario', body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } 

  static Future<bool> actUsuario(body) async {
    final response = await http.put('${URLS.BASE_URL}/Usuario', body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  } 

    static Future<List<dynamic>> getEventos() async {
    final response = await http.get('${URLS.BASE_URL}/Eventos');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<List<UsuarioLog>> buscarUsuario( usuario1, contrasena ) async {

    var response = await Dio().get(
      "http://estanteriaserver.ddns.net/api/Usuario",
      queryParameters: {"usuario1": usuario1, "contrasena": contrasena},
    );
    var result = UsuarioLog.fromJsonList(response.data);
    return result;

  }

  /*static Future<List<Usuario>> buscarUsuario( String query) async {

    final url = Uri.https(URLS.BASE_URL, 'Usuario', {
      'query'    : query
    });
    print(query);
    return await _procesarRespuesta(url);

  }

  static Future<List<Usuario>> _procesarRespuesta(Uri url) async {

    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);

    final usuarios = new Usuarios.fromJsonList(decodedData['results']);
    print(usuarios);

    return usuarios.items;
  }*/
}

class UsuarioLog {
  final String usuario1;
  final String contrasena;

  UsuarioLog({this.usuario1, this.contrasena});

  @override
  String toString() {
    return '$usuario1, $contrasena';
  }

  factory UsuarioLog.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return UsuarioLog(
      usuario1: json["usuario1"],
      contrasena: json["contrasena"],
    );
  }

  static List<UsuarioLog> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => UsuarioLog.fromJson(item)).toList();
  }

  @override
  operator ==(object) => this.usuario1.contains(object) || this.contrasena.contains(object);

  @override
  int get hashCode => usuario1.hashCode ^ contrasena.hashCode;
}