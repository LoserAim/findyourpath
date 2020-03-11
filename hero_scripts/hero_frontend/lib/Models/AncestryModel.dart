import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';

class Heritage {
  int id;
  String name;
  String description;

  Heritage({this.id, this.name, this.description});
  Heritage.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'];
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
  Heritage.getHeritage(int id) {
    APIservice.getAncestryById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      return Heritage.fromMappedJson(res);
    });
  }
}

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
      {this.id,
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
      return Ancestry.fromMappedJson(res);
    });

  }
}
