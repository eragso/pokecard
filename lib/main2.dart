import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecard/Maps/mapa.dart';
import 'package:pokecard/QR/homePage.dart';
import 'package:pokecard/api/apihome2.dart';
import 'package:pokecard/cartas.dart';
import 'package:pokecard/class_builder.dart';
import 'package:pokecard/home.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:pokecard/mazo.dart';
import 'package:pokecard/settings.dart';
import 'package:pokecard/subecartas.dart';

//Clase principal
class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('Home'),
      //Carga de todos los items del menu
      items: [
        KFDrawerItem.initWithPage(
          text:
              Text('Menu', style: TextStyle(color: Colors.white, fontSize: 18)),
          icon: Icon(Icons.home, color: Colors.white),
          page: Home()
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Mapa',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.map, color: Colors.white),
          page: mapa(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'QR',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.qr_code_scanner, color: Colors.white),
          page: HomePage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Api',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.qr_code_scanner, color: Colors.white),
          page: Api(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Cartas',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.info, color: Colors.white),
          page: Cartas(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Mazo',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.source, color: Colors.white),
          page: Mazo(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Sube Cartas',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.file_upload, color: Colors.white),
          page: SubeCartas(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Configuración',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: Settings(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage('images/descarga.jpg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('Eric Aguilo',
                        style:
                            new TextStyle(fontSize: 17, color: Colors.white)),
                    new SizedBox(height: 2),
                    new Text('Usuario',
                        style:
                            new TextStyle(fontSize: 15, color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'Cerrar sesión',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),onPressed: () {
              Navigator.of(context).pop();
            },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.blue,
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
