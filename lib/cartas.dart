import 'package:flutter/material.dart';
import 'package:pokecard/infocard.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:pokecard/infopage.dart';
import 'package:dio/dio.dart';
import 'package:easy_search/easy_search.dart';

class Cartas extends KFDrawerContent {
  @override
  _Cartas createState() => _Cartas();
}

class _Cartas extends State<Cartas> {
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
                  Text("Todas las cartas", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
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
                            Text("Cartas", style: TextStyle(fontSize: 30.0, color: Colors.yellow), 
                            ),
                          ]
                        ),
                    )
                  ],
                ),
              ),  
              Padding(
                padding: EdgeInsets.only(left: 15, top: 5, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 500,
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
                                    title: Text(item.nombre_carta),
                                    subtitle: Text(item.tipo_carta.toString()),
                                    leading: Icon(Icons.people),
                                  ),
                                ); 
                              },
                            ),
                          Container(
                          padding: EdgeInsets.only(top: 13),
                          height: 404,
                          child: GridView.count(
                            padding: EdgeInsets.only(top: 13, left: 7),
                            crossAxisCount: 4,
                            children: List.generate(52, (index) {
                              return Center(
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    listCard('images/incineroar.png'),
                                  ],
                                )
                                /*child: Text(
                                  'Item $index',
                                  style: Theme.of(context).textTheme.headline5,
                                ),*/
                              );
                            }),
                          ),
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
  final String nombre_carta;
  final String tipo_carta;

  ModelExample({this.nombre_carta, this.tipo_carta});

  @override
  String toString() {
    return '$nombre_carta';
  }

  factory ModelExample.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ModelExample(
      nombre_carta: json["nombre_carta"],
      tipo_carta: json["tipo_carta"],
    );
  }

  static List<ModelExample> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => ModelExample.fromJson(item)).toList();
  }

  @override
  operator ==(object) => this.nombre_carta.toLowerCase().contains(object.toLowerCase()) || this.tipo_carta.toLowerCase().contains(object.toLowerCase);

  @override
  int get hashCode => nombre_carta.hashCode ^ tipo_carta.hashCode;
}

