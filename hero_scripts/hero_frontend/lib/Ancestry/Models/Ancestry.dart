import 'dart:convert';
import 'package:hero_frontend/Feat/Models/Feat.dart';
import 'package:hero_frontend/Services/apihandler.dart';

import 'Heritage.dart';

class Ancestry {
  int id;
  String name;
  int hit_points;
  String size;
  int speed;
  int free_boosts;
  List<String> ability_boosts;
  List<String> ability_flaws;
  List<String> languages;
  List<String> traits;
  List<String> special_abilities;
  List<Heritage> heritages;
  List<Feat> feats;
  String book;
  int pgnum;


  Ancestry(
      {
      this.id,
      this.hit_points,
      this.name,
      this.size,
      this.free_boosts,
      this.speed,
      this.ability_boosts,
      this.ability_flaws,
      this.languages,
      this.traits,
      this.special_abilities,
      this.heritages,
      this.feats,
      this.book,
      this.pgnum});


  Ancestry.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        hit_points = json['hit_points'],
        size = json['size'],
        free_boosts = json['free_boosts'],
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
        pgnum = json['pgnum'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'hit_points': hit_points,
        'size': size,
        'speed': speed,
        'name': name,
        'free_boosts': free_boosts,
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
Ancestry.getAncestry(int id) {
    APIservice.getAncestryById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      Ancestry temp = Ancestry.fromMappedJson(res);
      this.id = temp.id;
      this.hit_points = temp.hit_points;
      this.name = temp.name;
      this.size = temp.size;
      this.free_boosts = temp.free_boosts;
      this.speed = temp.speed;
      this.ability_boosts = temp.ability_boosts;
      this.ability_flaws = temp.ability_flaws;
      this.languages = temp.languages;
      this.traits = temp.traits;
      this.special_abilities = temp.special_abilities;
      this.heritages = temp.heritages;
      this.feats = temp.feats;
      this.book = temp.book;
      this.pgnum = temp.pgnum;
    });

  }
}
