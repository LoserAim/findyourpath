import 'package:flutter/material.dart';

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
   



}