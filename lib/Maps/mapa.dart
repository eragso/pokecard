import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kf_drawer/kf_drawer.dart';

class mapa extends KFDrawerContent{
  final LatLng PointSds = LatLng(41.39429293388591, 2.128064709427111);
  final LatLng PointIlla = LatLng(41.38936778054854, 2.1351399065772796);
  final LatLng PointCorteIngles = LatLng(41.39528054334444, 2.140746981161061);
  final LatLng Point2 = LatLng(35.97999029198033, 139.7523160912061);
  final String point1name = "Salesians de Sarrià";
  final String point2name = "El Corte Inglés";
  final String point3name = "L'Illa";
  @override
  _mapa createState()=> _mapa();
}

class _mapa extends State<mapa>{
  GoogleMapController _mapController;
  @override
  Widget build(BuildContext context){
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
                  Text("Mapa", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
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
                      height: 550,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5.0, color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue[900],
                        ),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: widget.PointSds,
                            zoom: 12,
                          ),
                          markers: _createMarkers(),
                          onMapCreated: _onMapCreated,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
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
  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    point(widget.point1name, widget.PointSds);
    tmp.add(
      Marker(
        markerId: MarkerId(widget.point1name),
        position: widget.PointSds,
        infoWindow: InfoWindow(title: widget.point1name),
      ),
    );
    tmp.add(
      Marker(
        markerId: MarkerId(widget.point2name),
        position: widget.PointCorteIngles,
        infoWindow: InfoWindow(title: widget.point2name),
      ),
    );
    tmp.add(
      Marker(
        markerId: MarkerId(widget.point3name),
        position: widget.PointIlla,
        infoWindow: InfoWindow(title: widget.point3name),
      ),
    );
    return tmp;
  }
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }
}
void point (String name, LatLng loc){
  var tmp = Set<Marker>();
  tmp.add(
    Marker(
      markerId: MarkerId(name),
      position: loc,
      infoWindow: InfoWindow(title: name),
    ),
  );
}