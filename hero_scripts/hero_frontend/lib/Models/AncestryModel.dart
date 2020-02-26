import 'package:flutter/material.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';

class Heritage {
  int id;
  String name;
  String description;
  int level;
  bool selected;
  Heritage(this.id, this.name, this.description, {this.selected});
  Heritage.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        level = json['level'],
        name = json['name'],
        description = json['description'],
        selected = false;
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'level': level,
        'description': description,
      };
}

class Ancestry {
  int id;
  String name;
  int hit_points;
  String size;
  int speed;
  List<String> ability_boosts;
  List<String> ability_flaws;
  List<String> languages;
  List<String> traits;
  List<String> special_abilities;
  List<Heritage> heritages;
  List<Feat> feats;
  String book;
  int pgnum;
  bool selected;

  Ancestry(
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


  Ancestry.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        hit_points = json['hit_points'],
        size = json['size'],
        speed = json['speed'],
        ability_boosts = json['ability_boosts'].cast<String>(),
        ability_flaws = json['ability_flaws'].cast<String>(),
        languages = json['languages'].cast<String>(),
        traits = json['traits'].cast<String>(),
        special_abilities = json['special_abilities'].cast<String>(),
        heritages = json['heritages']
            .map((heritage) => Heritage.fromMappedJson(heritage))
            .cast<Heritage>()
            .toList(),
        feats = json['feats']
            .map((feat) => Feat.fromMappedJson(feat))
            .cast<Feat>()
            .toList(),
        book = json['book'],
        pgnum = json['pgnum'],
        selected = false;

  Map<String, dynamic> toJson() => {
        'id': id,
        'hit_points': hit_points,
        'size': size,
        'speed': speed,
        'name': name,
        'ability_boosts': ability_boosts,
        'ability_flaws': ability_flaws,
        'languages': languages,
        'traits': traits,
        'special_abilities': special_abilities,
        'heritages': heritages.map((heritage) => heritage.toJson()),
        'feats': feats.map((feat) => feat.toString()),
        'book': book,
        'pgnum': pgnum,
      };

  Widget toDetailWidget() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              "${this.name}",
              style: text_format.display3,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Health Points: \t', style: text_format.body2),
                    TextSpan(
                      text: this.hit_points.toString(),
                      style: text_format.body1,
                    )
                  ])),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      //textAlign: TextAlign.left,
                      text: TextSpan(children: [
                    TextSpan(text: 'Speed: \t', style: text_format.body2),
                    TextSpan(
                      text: this.speed.toString(),
                      style: text_format.body1,
                    )
                  ])),
                ),
              ),
            ),
            Row(
              //mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ability Boosts: ', style: text_format.body2),
                ),
                SizedBox(
                  height: 20.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      //physics:  BouncingScrollPhysics(),
                      itemCount: this.ability_boosts.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index != this.ability_boosts.length - 1)
                          return Text("${this.ability_boosts[index]}, ",
                              style: text_format.body1);
                        else
                          return Text("${this.ability_boosts[index]}",
                              style: text_format.body1);
                      }),
                ),
              ],
            ),
            Row(
              //mainAxisSize: MainAxisSize.min,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Ability Flaw: ', style: text_format.body2),
                ),
                SizedBox(
                  height: 20.0,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      //physics:  BouncingScrollPhysics(),
                      itemCount: this.ability_flaws.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index != this.ability_flaws.length - 1)
                          return Text("${this.ability_flaws[index]}, ",
                              style: text_format.body1);
                        else
                          return Text("${this.ability_flaws[index]}",
                              style: text_format.body1);
                      }),
                ),
              ],
            ),
            ListView.builder(
                itemCount: this.feats.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  if (index != this.ability_flaws.length - 1)
                    return Text("${this.ability_flaws[index]}, ",
                        style: text_format.body1);
                  else
                    return Text("${this.ability_flaws[index]}",
                        style: text_format.body1);
                }),
          ],
        ),
      );
    });
  }


}
