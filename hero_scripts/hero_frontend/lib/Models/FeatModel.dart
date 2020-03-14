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
   
  Feat.getFeat(int id){
    APIservice.getFeatById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      Feat temp = Feat.fromMappedJson(res);
      this.id = temp.id;
      this.name = temp.name;
      this.description = temp.description;
      this.level = temp.level;
      this.pgnum = temp.pgnum;
      this.book = temp.book;

    });
  }


}