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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (val) {
                  featList.clear();
                  getFeats();
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 25.0),
                  hintText: "Search here",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: null,
                  ),
                ),
                )
              ),
            SizedBox(
              height: 10.0,
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              //TODO: Need to get list of feats!
              shrinkWrap: true,
              itemCount: featList.length,
              itemBuilder: (BuildContext context, int index) {
              return buildNIFeatCard(featList[index]);
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
              title: Text(data['title']),
              subtitle: Text(data['description']),
            ),
            Divider(color: Colors.black,)
        ],
      ),
    );
}