import 'package:flutter/material.dart';
import 'package:pokecard/infocard.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:dio/dio.dart';
import 'package:easy_search/easy_search.dart';

class Mazo extends KFDrawerContent {
  @override
  _Mazo createState() => _Mazo();
}

class _Mazo extends State<Mazo> {
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
                padding: EdgeInsets.only(left: 15, top: 5, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 300,
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
                            buildInformation(),
                            EasySearch(
                              multipleSelect: false,
                              onChange: (value) {
                                print(value?.length);
                              },
                              onSearch: (text) {
                                print('Filter Query: $text');
                                return getData(nombre_carta: text);
                              },
                              searchResultSettings: SearchResultSettings(
                                padding: EdgeInsets.only(left: 8.0, top: 0, right: 8.0),
                              ),
                              customItemBuilder: (BuildContext context, ModelExample item, bool isSelected) {
                                return Container(
                                  decoration: !isSelected
                                      ? null
                                      : BoxDecoration(
                                          border: Border.all(color: Theme.of(context).primaryColor),
                                          borderRadius: BorderRadius.circular(7),
                                          color: Colors.white,
                                        ),
                                  child: ListTile(
                                    selected: isSelected,
                                    title: Text(item.nombrecarta),
                                    subtitle: Text(item.tipocarta.toString()),
                                    leading: Icon(Icons.people),
                                  ),
                                ); 
                              },
                            ),
                          Container(
                          padding: EdgeInsets.only(top: 13),
                          height: 220,
                          child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            new SizedBox(width: 7),
                            listItem('images/incineroar.png'),
                            new SizedBox(width: 15),
                            listItem('images/mcharizardex.png'),
                            new SizedBox(width: 15),
                            listItem('images/ponyta.png'),
                          ],
                        )
                            ),
                          ], 
                        ), 
                        ), 
                  ],
                ), 
              ), Text("Tu mazo", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,), textAlign : TextAlign.center),
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                          padding: EdgeInsets.only(top: 13),
                          height: 220,
                          child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            new SizedBox(width: 7),
                            listItem('images/incineroar.png'),
                            new SizedBox(width: 15),
                            listItem('images/mcharizardex.png'),
                            new SizedBox(width: 15),
                            listItem('images/ponyta.png'),
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

  Widget listItem(String imgpath) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InfoCard(imgPath: imgpath,)));
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
  Widget buildInformation() {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 0),
        ),
      ],
    );
  }

  Future<List<ModelExample>> getData({nombre_carta}) async {
    var response = await Dio().get(
      "http://estanteriaserver.ddns.net/api/Cartas",
      //"https://5f24717b3b9d35001620456b.mockapi.io/user",
      queryParameters: {"nombre_carta": nombre_carta},
    );

    var result = ModelExample.fromJsonList(response.data);
    return result;
  }
}

class ModelExample {
  final String nombrecarta;
  final String tipocarta;

  ModelExample({this.nombrecarta, this.tipocarta});

  @override
  String toString() {
    return '$nombrecarta';
  }

  factory ModelExample.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ModelExample(
      nombrecarta: json["nombre_carta"],
      tipocarta: json["tipo_carta"],
    );
  }

  static List<ModelExample> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => ModelExample.fromJson(item)).toList();
  }

  @override
  operator ==(object) => this.nombrecarta.toLowerCase().contains(object.toLowerCase()) || this.tipocarta.toLowerCase().contains(object.toLowerCase);

  @override
  int get hashCode => nombrecarta.hashCode ^ tipocarta.hashCode;
}  
