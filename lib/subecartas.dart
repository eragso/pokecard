import 'package:flutter/material.dart';
import 'package:pokecard/detailpage.dart';
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
                    child: IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                        ),
                      onPressed: widget.onMenuPressed,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text("Sube tus cartas!", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
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
                                Text('We   '),
                              ]
                            ),
                            Column(
                              children: <Widget>[
                                Text('We move under cover and we move as one'),
                                Text('We move under cover and we move as one'),
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
                      padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 15),
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5.0, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue[900],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                          height: 80,
                          width: 300,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                              side: BorderSide(color: Colors.red)
                            ),
                            color: Colors.red,
                            textColor: Colors.yellow,
                            child: Text("Subir", style: TextStyle(fontSize: 30.0,),
                            ),
                            onPressed: widget.onMenuPressed,
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

  Widget listItem(String imgpath) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(imgPath: imgpath,)));
      },
      child: Container(
        width: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.fill),
        ),
      ),
    );
  }
}