import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryModel.dart';
import 'package:hero_frontend/Services/apihandler.dart';

class AncestrySelectorPage extends StatefulWidget {
  AncestrySelectorPage({Key key}) : super(key: key);

  @override
  _AncestrySelectorPageState createState() => _AncestrySelectorPageState();
}

class _AncestrySelectorPageState extends State<AncestrySelectorPage> {
  List<Ancestry> ancestryList = [];

  convertAncestryJson() async {
    APIservice.getAncestryList().then((responseBody) {
      List<dynamic> data = jsonDecode(responseBody);
      setState(() {
        data.forEach((value) {
          ancestryList.add(Ancestry.fromMappedJson(value));
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    convertAncestryJson();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueAccent.shade700,
        title: new Text("Select Your Crap"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          ListView.builder(
            physics: BouncingScrollPhysics(),
            //TODO: Need to get list of feats!
            shrinkWrap: true,
            itemCount: ancestryList.length,
            itemBuilder: (BuildContext context, int index) {
              return buildAncestryCard(ancestryList[index]);
            },
          )
        ],
      ),
    );
  }
  final header = TextStyle(fontSize: 16.0, color: Colors.lightBlue);
  Widget buildAncestryCard(data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text(data.name, style: TextStyle(color: Colors.lightBlue, fontSize: 28.0),),
            leading: Checkbox(
              value: data.selected,
              onChanged: (bool val) {
                setState(() {
                  data.selected = val;
                });
              },
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Hit Points: ' + data.hit_points.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Size: ' + data.size.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Speed: ' + data.speed.toString()),
              ),

              ExpansionTile(
                title: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Ability Boosts", style: header,)
                ),
                children: <Widget>[
                  
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0, bottom: 8.0),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.ability_boosts.length,
                        itemBuilder: (BuildContext context, int index) {
                        return Text(data.ability_boosts[index]);
                       },
                      ),
                    ),
                ],),
              
              ExpansionTile(
                title: Padding(
                  padding: const EdgeInsets.only(left:16.0),
                  child: Text(
                      "Ancestry Feats",
                      style: header,
                    ),
                ),
                
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:48.0, bottom: 8.0),
                    child: Container(
                      height: 100,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.feats.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(data.feats[index].name +
                              " " +
                              data.feats[index].level.toString());
                          //data.feats[index].buildFeatCard();
                        },
                      ),
                    ),
                  ),
                  
                ],

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(data.book + " Pg. " + data.pgnum.toString()),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
