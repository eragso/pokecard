import 'package:flutter/material.dart';
import 'package:pokecard/detailpage.dart';
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
                  Text("Forma tu mazo de ensueño!", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
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
                                return getData(name: text);
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
                                    title: Text(item.name),
                                    subtitle: Text(item.age.toString()),
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

  Future<List<ModelExample>> getData({name}) async {
    var response = await Dio().get(
      "https://5f24717b3b9d35001620456b.mockapi.io/user",
      queryParameters: {"name": name},
    );

    var result = ModelExample.fromJsonList(response.data);
    return result;
  }
}

class ModelExample {
  final String name;
  final int age;

  ModelExample({this.name, this.age});

  @override
  String toString() {
    return '$name $age';
  }

  factory ModelExample.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return ModelExample(
      name: json["name"],
      age: json["age"],
    );
  }

  static List<ModelExample> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => ModelExample.fromJson(item)).toList();
  }

  @override
  operator ==(object) => this.name.toLowerCase().contains(object.toLowerCase()) || this.age.toString().contains(object);

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}  
