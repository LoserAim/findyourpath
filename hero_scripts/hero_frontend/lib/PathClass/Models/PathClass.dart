import 'dart:convert';

import 'package:hero_frontend/Feat/Models/Feat.dart';
import 'package:hero_frontend/Services/apihandler.dart';

class Archetype {
  int id;
  String name;
  String description;
  int pgnum;
  String book;
  int pathClass;

  Archetype(
      {this.id,
      this.name,
      this.description,
      this.pgnum,
      this.book,
      this.pathClass});
  Archetype.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'],
        pathClass = json['path_class'],
        pgnum = json['pgnum'],
        book = json['book'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'path_class': pathClass,
        'pgnum': pgnum,
        'book': book,
      };
  Archetype.getArchetype(int id) {
    APIservice.getClassFeatureById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      return Archetype.fromMappedJson(res);
    });

  }
}

class Proficiency {
  int id;
  String name;
  String proficiency_type;
  String key_ability;
  String rank;

  Proficiency(
      {this.id, this.name, this.proficiency_type, this.key_ability, this.rank});
  Proficiency.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        proficiency_type = json['proficiency_type'],
        key_ability = json['key_ability'],
        rank = json['rank'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'proficiency_type': proficiency_type,
        'key_ability': key_ability,
        'rank ': rank,
      };
}

class PathClass {
  int id;
  int hit_points;
  String name;
  String key_ability;
  List<Proficiency> proficiencies;
  List<Archetype> archetypes;
  List<Feat> features;
  int additional_skills;
  List<Feat> class_feats;
  int pgnum;
  String book;
  PathClass(
      {this.id,
      this.name,
      this.key_ability,
      this.proficiencies,
      this.archetypes,
      this.features,
      this.additional_skills,
      this.class_feats,
      this.pgnum,
      this.book});

  PathClass.fromMappedJson(Map<String, dynamic> json)
      : id = json['id'],
        hit_points = json['hit_points'],
        name = json['name'],
        key_ability = json['key_ability'],
        proficiencies = json['proficiencies']
            .map((proficiency) => Proficiency.fromMappedJson(proficiency))
            .cast<Proficiency>()
            .toList(),
        archetypes = json['archetypes']
            .map((archetype) => Archetype.fromMappedJson(archetype))
            .cast<Archetype>()
            .toList(),
        features = json['features']
            .map((feature) => Feat.fromMappedJson(feature))
            .cast<Feat>()
            .toList(),
        additional_skills = json['additional_skills'],
        class_feats = json['class_feats']
            .map((classfeat) => Feat.fromMappedJson(classfeat))
            .cast<Feat>()
            .toList(),
        pgnum = json['pgnum'],
        book = json['book'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'hit_points': hit_points,
        'name': name,
        'key_ability': key_ability,
        'proficiencies': proficiencies,
        'archetypes': archetypes,
        'features': features,
        'additional_skills': additional_skills,
        'class_feats': class_feats,
        'pgnum': pgnum,
        'book': book,
      };


  
}
