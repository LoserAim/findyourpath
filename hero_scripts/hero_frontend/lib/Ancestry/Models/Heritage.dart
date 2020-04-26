import 'dart:convert';

import 'package:hero_frontend/Services/apihandler.dart';

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