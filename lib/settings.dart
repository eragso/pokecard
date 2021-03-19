import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class Settings extends KFDrawerContent {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings>  {
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyTExt = TextStyle(
    color: Colors.grey.shade400,
  );
  bool _noticorreo = false;
  bool _notiapp = false;
  String correo = "OFF";
  String app = "OFF";
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
                  Text("Configuración", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
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
                  children: <Widget>[
                ListTile(
                  title: Text(
                    "Idioma",
                    style: whiteText,
                  ),  
                  subtitle: Text(
                    "Español",
                    style: greyTExt,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Configuración del Perfil",
                    style: whiteText,
                  ),
                  subtitle: Text(
                    "Eric Aguilo",
                    style: greyTExt,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey.shade400,
                  ),
                  onTap: () {},
                ),
                SwitchListTile(
                  title: Text(
                    "Notificationes por Correo",
                    style: whiteText,
                  ),
                  subtitle: Text(
                    correo,
                    style: greyTExt,
                  ),
                  value: _noticorreo,
                   onChanged: (bool value) {
                    setState(() {
                      _noticorreo = value;
                      if (correo == "OFF"){
                        correo = "ON";
                      } else {
                        correo = "OFF";
                      }
                    });
                  },
                ),
                SwitchListTile(
                  title: Text(
                    "Notificationes App",
                    style: whiteText,
                  ),
                  subtitle: Text(
                    app,
                    style: greyTExt,
                  ),
                  value: _notiapp,
                   onChanged: (bool value) {
                    setState(() {
                      _notiapp = value;
                      if (app == "OFF"){
                        app = "ON";
                      } else {
                        app = "OFF";
                      }
                    });
                  },
                ),
                ],
                ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
