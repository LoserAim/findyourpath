import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
class FeatSelectorPage extends StatefulWidget {
  FeatSelectorPage({Key key}) : super(key: key);

  _FeatSelectorPageState createState() => _FeatSelectorPageState();
}

class _FeatSelectorPageState extends State<FeatSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
         backgroundColor: Colors.blueAccent.shade700,
         title: new Text("Select Your Feats"),
         
        ),
        body: ListView(
          children: <Widget>[
            ListView.builder(
              //TODO: Need to get list of feats!
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
              return ;
             },
            )
          ],
            
        ),
       );

  }
}



Widget buildNIFeatCard(data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
        children: <Widget>[
          ListTile(
              title: data['title'],
            )
        ],
      ),
    );
}