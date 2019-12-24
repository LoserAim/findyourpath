import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryModel.dart';
import 'package:hero_frontend/Pages/Feat/FeatModel.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';

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
    /*
      this.id,
      this.hit_points,
      this.name,
      this.size,
      this.speed,
      this.ability_boosts,
      this.ability_flaws,
      this.languages,
      this.traits,
      this.special_abilities,
      this.heritages,
      this.feats,
      this.book,
      this.pgnum,
      {this.selected});
    */
    //convertAncestryJson();
    ancestryList.add(Ancestry(
      1,
      10,
      'Dwarf',
      'Medium',
      20,
      ['STR', 'WIS'],
      ['CHA'],
      ['Dwarf', 'Common'],
      ['Dwarf', 'Humanoid'],
      ['Darkvision'],
      [Heritage(
        1,
        'Dwarven Heritage',
        'This is a temporary description',
        //true,
      )],
      [Feat(
        1,
        'Temp Feat Title',
        'Temp Feat Description',
        1,
        999,
        'N/A',
        //true
      )],
      'N/A',
      999
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blueAccent.shade700,
        title: Align(
          alignment: Alignment.center,
          child: Container(child: new Text("Ancestries", style: text_format.display4,))),
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
              return ancestryList[index].toCardWidget();
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
