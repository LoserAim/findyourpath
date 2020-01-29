import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:rxdart/rxdart.dart';

class Ancestry_Detail_Bloc {
  /*
  
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

   */

  final _id = BehaviorSubject<int>();
  final _hitPoints = BehaviorSubject<int>();
  final _size = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _abilityBoosts = BehaviorSubject<List<String>>();
  final _abilityFlaws = BehaviorSubject<List<String>>();
  final _languages = BehaviorSubject<List<String>>();
  final _traits = BehaviorSubject<List<String>>();
  final _specialAbilities = BehaviorSubject<List<String>>();
  final _heritages = BehaviorSubject<List<Heritage>>();
  final _feats = BehaviorSubject<List<Feat>>();
  final _book = BehaviorSubject<String>();
  final _pgnum = BehaviorSubject<int>();
  final _ancestry = BehaviorSubject<Ancestry>();

  Function(String) get changeSize => _size.sink.add;
  
}