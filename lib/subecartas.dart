import 'package:flutter/material.dart';
import 'package:pokecard/infocard.dart';
import 'package:kf_drawer/kf_drawer.dart';

class SubeCartas extends KFDrawerContent {
  @override
  _SubeCartas createState() => _SubeCartas();
}

class _SubeCartas extends State<SubeCartas> {
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
                  Spacer(flex: 2),
                  Text("Sube Cartas", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
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
                      height: 241,
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
                                  height: 221,
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
                                  height: 221,
                                  width: 200,
                                  color: Colors.yellow,
                                  child: Column(
                                    children: <Widget> [
                                      Row( children: [
                                      Column(
                                        children: <Widget>[
                                          Text('Nombre', style: TextStyle(fontSize: 40.0,)),
                                          SizedBox(height: 30),
                                          Text('Nombre'),
                                          Text('Nombre'),
                                          Text('Nombre'),
                                        ]
                                      ),], ),
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
                      height: 241,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5.0, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue[900],
                        ),
                        child: Column(
                          children: <Widget>[
                            Text('Ataques', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                            Row( children: [
                            Column(
                              children: <Widget>[
                                Text('Nombre'),
                                Text('Nombre'),
                                Text('Nombre'),
                                Text('Nombre'),
                              ]
                            ),
                            Column(
                              children: <Widget>[
                                Text('Land'),
                              ]
                            ),], ),
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
                            child: Text("Comprar", style: TextStyle(fontSize: 25.0,),
                            ),
                            onPressed: () {},
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
                                child: Text("Vender", style: TextStyle(fontSize: 25.0,),
                                ),
                                onPressed: () {},
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
  Widget listCard(String imgpath) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InfoCard(imgPath: imgpath,)));
      },
      child: Container(
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
