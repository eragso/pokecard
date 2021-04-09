import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:kf_drawer/kf_drawer.dart';

class GeneratePage extends KFDrawerContent {
  @override
  State<StatefulWidget> createState() => GeneratePageState();
}

class GeneratePageState extends State<GeneratePage> {
  String qrData =
      "https://github.com/neon97";  // already generated qr code when the page opens

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
                    padding: EdgeInsets.only(left: 30, top: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: QrImage(
                            //place where the QR Image will be shown
                            data: qrData,
                          ),
                          height: 380,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: 5.0, color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                        ),
                        TextField(
                          controller: qrdataFeed,
                          decoration: InputDecoration(
                            hintText: "Agrega la URL",
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 15, top: 30, right: 15),
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
                                  child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                        side: BorderSide(color: Colors.red)
                                    ),
                                    color: Colors.red,
                                    padding: EdgeInsets.all(15.0),
                                    onPressed: () async {

                                      if (qrdataFeed.text.isEmpty) {        //a little validation for the textfield
                                        setState(() {
                                          qrData = "";
                                        });
                                      } else {
                                        setState(() {
                                          qrData = qrdataFeed.text;
                                        });
                                      }
                                    },
                                    child: Text(
                                      "Generar QR",
                                      style: TextStyle(
                                          fontSize: 25.0, color: Colors.yellow, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )

                              ]

                          )

                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
  final qrdataFeed = TextEditingController();
}