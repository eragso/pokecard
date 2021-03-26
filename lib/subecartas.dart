import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:pokecard/api/rest_api.dart';

class SubeCartas extends KFDrawerContent {
  @override
  _SubeCartas createState() => _SubeCartas();
}

class _SubeCartas extends State<SubeCartas> {
  final _nombrecarta = TextEditingController();
  final _generacion = TextEditingController();
  final _tipocarta = TextEditingController();
  final _psa = TextEditingController();
  final _hp = TextEditingController();
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
            new Row(
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
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage('images/descarga.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 15)
              ],
            ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 55, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 271,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5.0, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue[900],
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                new Padding(
                                  padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                                  child: Container(
                                  height: 250,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage('images/incineroar.png'), fit: BoxFit.fill)),
                                ),
                                ),
                              ]
                            ),
                            Column(
                              children: <Widget>[
                                new Padding(
                                padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                                child: Container(
                                  height: 250,
                                  width: 200,
                                  child: Column(
                                    children: <Widget> [
                                      TextField(
                                        controller: _nombrecarta,
                                        decoration: InputDecoration(
                                          hintText: 'Nombre Carta*'),
                                        ),
                                        TextField(
                                          controller: _tipocarta,
                                          decoration: InputDecoration(
                                            hintText: 'Tipo*'),
                                          ),
                                        TextField(
                                          controller: _generacion,
                                          decoration: InputDecoration(
                                            hintText: 'Generación'),
                                          ),
                                        TextField(
                                          controller: _psa,
                                          decoration: InputDecoration(
                                            hintText: 'PSA'),
                                          ),
                                        TextField(
                                          controller: _hp,
                                          decoration: InputDecoration(
                                            hintText: 'HP'),
                                          ),
                                    ],
                                  ),
                                )
                                ),
                              ]
                            ),
                            ],
                        ),
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
                      decoration: BoxDecoration(
                        border: Border.all(width: 5.0, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue[900],
                      ),
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
                            child: Text("Subir", style: TextStyle(fontSize: 25.0,),
                            ),
                            onPressed: () {
                  final body = {
                    "nombre_carta": _nombrecarta.text,
                    "generación": _generacion.text,
                    "tipo_carta": _tipocarta.text,
                    "PSA": _psa.text,
                    "Hp": _hp.text,
                  };
                  ApiService.addCartas(body).then((success) {
                    if (success) {
                      showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Carta Añadida!!!'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _nombrecarta.text = '';
                                _generacion.text = '';
                                _tipocarta.text = '';
                                _psa.text = '';
                                _hp.text = '';
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
                            ), 
                          ], 
                        ), 
                        ), 
                  ],
                ), 
              ),
        ],
      ),
    )
    )
    );
  }
}
