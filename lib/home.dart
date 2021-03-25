import 'package:flutter/material.dart';
import 'package:pokecard/infocard.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:pokecard/infopage.dart';

class Home extends KFDrawerContent {
  Home({
    Key key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  Text("Menu Principal", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
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
                padding: EdgeInsets.only(left: 15, top: 5, right: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                        border: Border.all(width: 5.0, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Noticias", style: TextStyle(fontSize: 30.0, color: Colors.yellow), 
                            ),
                          ]
                        ),
                    )
                  ],
                ),
              ),  
              Padding(
                padding: EdgeInsets.only(left: 15, top: 0, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 150,
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
                          padding: EdgeInsets.only(top: 13),
                          height: 120,
                          child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            new SizedBox(width: 7),
                            listItem('images/news.png'),
                            new SizedBox(width: 15),
                            listItem('images/leyendas.jpg'),
                          ],
                        )
                            ),
                          ], 
                        ), 
                        ), 
                  ],
                ), 
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15, right: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                        border: Border.all(width: 5.0, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Mercado", style: TextStyle(fontSize: 30.0, color: Colors.yellow), 
                            ),
                          ]
                        ),
                    )
                  ],
                ),
              ),  
              Padding(
                padding: EdgeInsets.only(left: 15, top: 0, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                        border: Border.all(width: 5.0, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue[900],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Container(
                          padding: EdgeInsets.only(top: 5),
                          height: 120,
                          child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            new SizedBox(width: 7),
                            listCard('images/incineroar.png'),
                            new SizedBox(width: 10),
                            listCard('images/mcharizardex.png'),
                            new SizedBox(width: 10),
                            listCard('images/ponyta.png'),
                            new SizedBox(width: 10),
                            listCard('images/ponyta.png'),
                          ],
                        )
                            ),
                          ], 
                        ), 
                        ), 
                  ],
                ), 
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15, right: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                        border: Border.all(width: 5.0, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Eventos", style: TextStyle(fontSize: 30.0, color: Colors.yellow), 
                            ),
                          ]
                        ),
                    )
                  ],
                ),
              ),  
              Padding(
                padding: EdgeInsets.only(left: 15, top: 0, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 150,
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
                          padding: EdgeInsets.only(top: 13),
                          height: 120,
                          child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            new SizedBox(width: 7),
                            listItem('images/e_leyendas.jpeg'),
                            new SizedBox(width: 15),
                            listItem('images/e_2021.jpg'),
                          ],
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
  Widget listItem(String imgpath) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => InfoPage(imgPath: imgpath,)));
      },
      child: Container(
        width: 145,
        decoration: BoxDecoration(
          border: Border.all(width: 4.0, color: Colors.yellow),
          borderRadius: BorderRadius.all(Radius.circular(0)),
          image: DecorationImage(image: AssetImage(imgpath), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
