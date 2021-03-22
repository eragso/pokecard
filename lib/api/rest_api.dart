import 'dart:convert';

import 'package:http/http.dart' as http;

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
}
