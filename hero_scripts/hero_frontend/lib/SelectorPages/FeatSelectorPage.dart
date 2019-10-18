import 'dart:ffi';

import 'package:flutter/material.dart';
import '../Services/apihandler.dart';

import 'dart:convert';

class FeatSelectorPage extends StatefulWidget {
  FeatSelectorPage({Key key}) : super(key: key);

  _FeatSelectorPageState createState() => _FeatSelectorPageState();
}

class _FeatSelectorPageState extends State<FeatSelectorPage> {
  List<dynamic> featList = [];

  getFeats() async {
    APIservice.getFeatList().then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      setState(() {
       data.forEach((value) {
         featList.add(value);
       });
      });
    });
  }
  
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