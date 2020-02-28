import 'package:flutter/material.dart';

class Feat{
  int id;
  String name;
  String description;
  int level;
  int pgnum;
  String book;
  bool selected;

  Feat(this.id,this.name,this.description,this.level, this.pgnum, this.book, {this.selected=false});
  Feat.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        level = json['level'],
        pgnum = json['pgnum'],
        book = json['book'],
        selected =false;

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'name': name,
      'description': description,
      'level': level,
      'pgnum': pgnum,
      'book' :book,
    };
   



   Widget buildFeatCard() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: <Widget>[
              ExpansionTile(
                  title: Text(name + ' ' + level.toString()),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(description),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(book + " Pg. "  + pgnum.toString()),
                    ),
                    
                  ],
                ),
                Divider(color: Colors.black,)
            ],
          ),
        );
  }
}