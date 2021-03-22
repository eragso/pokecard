import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  int id_carta;
  String email;
  String firstName;
  String lastName;


  Employee({
    this.id_carta,
    this.email,
    this.firstName,
    this.lastName,

  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id_carta: json["id_carta"],
        email: json["nombre_carta"],
        firstName: json["tipo_carta"],
        lastName: json["PSA"],

      );

  Map<String, dynamic> toJson() => {
        "id_carta": id_carta,
        "nombre_carta": email,
        "tipo_carta": firstName,
        "PSA": lastName,

      };
}