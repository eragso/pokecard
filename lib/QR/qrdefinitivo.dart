import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:pokecard/QR/generate.dart';
import 'package:pokecard/QR/scan.dart';

class qrdefinitivo extends KFDrawerContent {

  @override
  _qrdefinitivo createState() => _qrdefinitivo();
}

class _qrdefinitivo extends State<qrdefinitivo> {
  bool tempValue = false;

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
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    child: Material(
                      shadowColor: Colors.transparent,
                      color: Colors.transparent,
                      child: FlatButton(
                        onPressed: widget.onMenuPressed,
                        padding: EdgeInsets.all(0.0),
                        child: Image.asset('images/pokeball.png', height: 40, width: 40,))
                    ),
                  ),
                  Spacer(flex:4),
                  Text("QR", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  Spacer(flex: 4),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 420,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: 5.0, color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue[900],

                            image: DecorationImage(
                                image: AssetImage('images/QRsolgaleoBueno.png'),
                                fit: BoxFit.cover),
                          ),
                          child: Row(
                            children: <Widget>[
                              Column(
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 16, top: 15, right: 10, bottom: 15),
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
                                  width: 130,
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: Colors.red)
                                      ),
                                      color: Colors.red,
                                      textColor: Colors.yellow,
                                      child: Text("Escanear QR", style: TextStyle(fontSize: 23.0,),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ScanPage()),
                                        );
                                      }
                                  )
                              ),
                              SizedBox(width: 25),
                              Container(
                                  height: 80,
                                  width: 130,
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                          side: BorderSide(color: Colors.red)
                                      ),
                                      color: Colors.red,
                                      textColor: Colors.yellow,
                                      child: Text("Generar QR", style: TextStyle(fontSize: 23.0,),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => GeneratePage()),
                                        );
                                      }
                                  )
                              )
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