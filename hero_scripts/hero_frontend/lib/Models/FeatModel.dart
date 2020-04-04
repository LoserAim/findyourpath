import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hero_frontend/Services/apihandler.dart';

class Feat{
  int id;
  String name;
  String description;
  int level;
  int pgnum;
  String book;

  Feat({this.id,this.name,this.description,this.level, this.pgnum, this.book});
  Feat.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        level = json['level'],
        pgnum = json['pgnum'],
        book = json['book'];

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'name': name,
      'description': description,
      'level': level,
      'pgnum': pgnum,
      'book' :book,
    };
   

  static Future<Feat> getFeat(int id) async => Feat.fromMappedJson(jsonDecode(await APIservice.getFeatById(id)));
  static Future<Feat> getClassFeature(int id) async => Feat.fromMappedJson(jsonDecode(await APIservice.getClassFeatureById(id)));


  static Future<List<Feat>> getClassFeatures(List<int> ids) async {
    List<Feat> itemList = List();
    for (int i = 0; i < ids.length; i++) {
      itemList.add(await Feat.getClassFeature(ids[i]));
    };
    return itemList;
  }
}