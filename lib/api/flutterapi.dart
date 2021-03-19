import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kf_drawer/kf_drawer.dart';

class FlutterApi extends KFDrawerContent {
  @override
  _FlutterApi createState() => _FlutterApi();
}

class _FlutterApi extends State<FlutterApi> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
        backgroundColor: Colors.grey,
        title: Text('Api to sqlite', style: TextStyle(color: Colors.red),),
        centerTitle: true,
      )
        
    );
  }
}
