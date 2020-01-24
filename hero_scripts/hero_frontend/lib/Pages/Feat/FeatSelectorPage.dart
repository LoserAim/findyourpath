import 'package:flutter/material.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Services/apihandler.dart';

import 'dart:convert';

class FeatSelectorPage extends StatefulWidget {
  FeatSelectorPage({Key key}) : super(key: key);

  _FeatSelectorPageState createState() => _FeatSelectorPageState();
}

class _FeatSelectorPageState extends State<FeatSelectorPage> {
  List<Feat> featList = [];

  getFeats(value) async {
    APIservice.getGeneralFeatList(value).then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      setState(() {
       data.forEach((value) {
         featList.add(Feat.fromMappedJson(value));
       });
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFeats('');
    
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
                  getFeats(val);
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
              return buildFeatCard(featList[index]);
             },
            )
          ],
            
        ),
       );

  }





    Widget buildFeatCard(data) {
      return Card(
              child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              children: <Widget>[
                ExpansionTile(
                    title: Text(data.name + ' ' + data.level.toString()),
                    leading: Checkbox(
                        value: data.selected,
                        onChanged: (bool val) { 
                          setState((){
                            data.selected = val;
                            });},),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data.description),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(data.book + " Pg. "  + data.pgnum.toString()),
                      ),
                      
                    ],
                  ),
                  Divider(color: Colors.black,)
              ],
            ),
          ),
      );
  }
}



