import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  final imgPath;

  InfoPage({Key key, this.imgPath}) : super(key: key);

  @override
  _InfoPage createState() => _InfoPage();
}

class _InfoPage extends State<InfoPage> {
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
                                  padding: EdgeInsets.only(left: 9, top: 7.5, right: 5),
                                  child: Container(
                                  height: 211,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image: NetworkImage(widget.imgPath), fit: BoxFit.fill))),
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
                padding: EdgeInsets.only(left: 15, top: 15, right: 15),
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
                            Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Column( children: [
                            Text('TITULO', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
                            ],),
                            ),
                            Padding( 
                            padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                            child: Row( children: [
                              Text('INFOoooooooooooooooooooooooooooooooooo \nMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
                              ], ), ),
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
      onTap: () {  },
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
