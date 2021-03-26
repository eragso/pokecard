import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:pokecard/api/rest_api.dart';

class ActualizarPerfil extends KFDrawerContent {
  @override
  _ActualizarPerfil createState() => _ActualizarPerfil();
}

class _ActualizarPerfil extends State<ActualizarPerfil>  {
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyTExt = TextStyle(
    color: Colors.grey.shade400,
  );
  final _nombreusuario = TextEditingController();
  final _apellido = TextEditingController();
  final _usuario = TextEditingController();
  final _contrasena = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
            ), 
        child: ListView(
          children: <Widget>[
              Row(
              children: <Widget>[
                new IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Spacer(),
                Container(
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('images/pokecard.png'),
                      fit: BoxFit.fill)),
                  ),
                SizedBox(width: 15)
              ],
            ),
              Padding(
              padding: EdgeInsets.only(left: 15, top: 5, right: 15),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _nombreusuario,
                      decoration: InputDecoration(
                        hintText: 'Nombre'),
                      ),
                      TextField(
                        controller: _apellido,
                        decoration: InputDecoration(
                          hintText: 'Apellido'),
                      ),
                      TextField(
                        controller: _usuario,
                        decoration: InputDecoration(
                          hintText: 'Usuario'),
                      ),
                      TextField(
                        controller: _contrasena,
                        decoration: InputDecoration(
                        hintText: 'Contraseña'),
                      ),
                ],
                ),
                ),
                Padding(
                padding: EdgeInsets.only(left: 15, top: 5, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 40, top: 15, right: 40, bottom: 15),
                      height: 120,
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                          height: 80,
                          width: 230,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.red)
                            ),
                            color: Colors.red,
                            textColor: Colors.yellow,
                            child: Text("Actualizar", style: TextStyle(fontSize: 25.0,),
                            ),
                            onPressed: () {
                              final body = {
                                "nombre_usuario": _nombreusuario.text,
                                "apellido": _apellido.text,
                                "usuario": _usuario.text,
                                "contrasena": _contrasena.text,
                              };
                              ApiService.actUsuario(body).then((success) {
                                if (success) {
                                  showDialog(
                                    builder: (context) => AlertDialog(
                                      title: Text('Usuario Actualizado!'),
                                      actions: <Widget>[
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _nombreusuario.text = '';
                                            _apellido.text = '';
                                            _usuario.text = '';
                                            _contrasena.text = '';
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
                                      title: Text('Error Actualizando Usuario!'),
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
                            ), 
                          ], 
                        ), 
                        ), 
                  ],
                ), 
              ),
              ],
            ),
          ),
        ),
      );
  }
}
