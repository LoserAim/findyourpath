import 'package:hero_frontend/Pages/Feat/FeatModel.dart';

class Heritage {
  int id;
  String name;
  String description;
  bool selected;
  Heritage(this.id, this.name, this.description, {this.selected});
  Heritage.fromMappedJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    description = json['description'],
    selected = false;
  Map<String, dynamic> toJson() =>
  {
    'id': id,
    'name': name,
    'description' : description,
  };
}


class Ancestry{
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
    {this.selected}
    );
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
        heritages = json['heritages'].map((heritage) => Heritage.fromMappedJson(heritage)).cast<Heritage>().toList(),
        feats = json['feats'].map((feat) => Feat.fromMappedJson(feat)).cast<Feat>().toList(),
        book = json['book'],
        pgnum = json['pgnum'],
        selected = false;

  Map<String, dynamic> toJson() =>
    {
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
}