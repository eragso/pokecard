import 'package:flutter/material.dart';
import 'package:pokecard/api2/rest_api.dart';
import 'package:kf_drawer/kf_drawer.dart';

class Api extends KFDrawerContent {
  @override
  _Api createState() => _Api();
}

class _Api extends State<Api> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter REST API'),
      ),
      body: FutureBuilder(
        future: ApiService.getEmployees(),
        builder: (context, snapshot) {
          final employees = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2,
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(employees[index]['nombre_carta']),
                  subtitle: Text('Tipo: ${employees[index]['tipo_carta']}'),
                );
              },
              itemCount: employees.length,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewEmployeePage(),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddNewEmployeePage extends StatefulWidget {
  AddNewEmployeePage({Key key}) : super(key: key);

  _AddNewEmployeePageState createState() => _AddNewEmployeePageState();
}

class _AddNewEmployeePageState extends State<AddNewEmployeePage> {
  final _employeeNameController = TextEditingController();
  final _employeeAge = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Employee'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _employeeNameController,
                decoration: InputDecoration(hintText: 'Nombre Carta'),
              ),
              TextField(
                controller: _employeeAge,
                decoration: InputDecoration(hintText: 'Tipo Carta'),
                //keyboardType: TextInputType.number,
              ),
              RaisedButton(
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.purple,
                onPressed: () {
                  final body = {
                    "nombre_carta": _employeeNameController.text,
                    "tipo_carta": _employeeAge.text,
                  };
                  ApiService.addEmployee(body).then((success) {
                    if (success) {
                      showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Carta Añadida!!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _employeeNameController.text = '';
                                _employeeAge.text = '';
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
                      return;
                    }else{
                      showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Error Añadiendo Carta!!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            )
                          ],
                        ),
                        context: context,
                      );
                      return;
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
