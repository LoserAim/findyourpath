import 'package:hero_frontend/Models/AbilityModel.dart';
import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';

import 'FeatModel.dart';

class Character {
  Ability strength;
  Ability dexterity;
  Ability constitution;
  Ability intelligence;
  Ability wisdom;
  Ability charisma;

  String name;
  String playerName;
  Path_Class path_class;
  Ancestry ancestry;
  Heritage heritage;
  Archetype archetype;

  List<Feat> classFeats;
  List<Feat> ancestryFeats;
  List<Feat> skillFeats;
  List<Feat> generalFeats;

  int level;
  int hit_poits;
  int experience;

}