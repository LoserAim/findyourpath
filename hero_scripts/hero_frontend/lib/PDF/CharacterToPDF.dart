
import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Models/CharacterModel.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/PDF/pdfExample.dart';
import 'package:pdf/widgets.dart';
Map<String, int> rank = {
  '0' : 0,
  'T' : 2,
  'E' : 4,
  'M' : 6,
  'L' : 8,
};

Widget generateAbilityScores(Character character){
  character.path_class = Path_Class.getClass(character.path_classId);
  Map<String, int> abilitymodifiers = {
    'STR': character.strength.modifier,
    'DEX': character.dexterity.modifier,
    'CON': character.constitution.modifier,
    'INT': character.intelligence.modifier,
    'WIS': character.wisdom.modifier,
    'CHA': character.charisma.modifier,
  };
  Proficiency classDC = character.getClassDCProficiency();
  int keyability = abilitymodifiers[classDC.key_ability];
  int prof = rank[classDC.rank];
  int profrank = (prof/2).floor();
  int totalCDC = keyability + prof;
  
return buildAbilityScoresColumn(
  strmod: character.strength.modifier > 0 ? "+" + character.strength.modifier.toString() : character.strength.modifier.toString(),
  strsco: character.strength.score.toString(),
  dexmod: character.dexterity.modifier > 0 ? "+" + character.dexterity.modifier.toString() : character.dexterity.modifier.toString(),
  dexsco: character.dexterity.score.toString(),
  conmod: character.constitution.modifier > 0 ? "+" + character.constitution.modifier.toString() : character.constitution.modifier.toString(),
  consco: character.constitution.score.toString(),
  intmod: character.intelligence.modifier > 0 ? "+" + character.intelligence.modifier.toString() : character.intelligence.modifier.toString(),
  intsco: character.intelligence.score.toString(),
  wismod: character.wisdom.modifier > 0 ? "+" + character.wisdom.modifier.toString() : character.wisdom.modifier.toString(),
  wissco: character.wisdom.score.toString(),
  chamod: character.charisma.modifier > 0 ? "+" + character.charisma.modifier.toString() : character.charisma.modifier.toString(),
  chasco: character.charisma.score.toString(),
  classNum: totalCDC.toString(),
  key: keyability > 0 ? "+" + keyability.toString() : keyability.toString(),
  profNum: prof.toString(),
  prof: profrank,
  item: '0',
);
}

Widget generateGenericInfo(Character character){
  character.ancestry = Ancestry.getAncestry(character.ancestryId);
  character.heritage = Heritage.getHeritage(character.heritageId);
  character.path_class = Path_Class.getClass(character.path_classId);
  return buildGenericInformationRow(
    nameCharacter: character.name ?? '',
    namePlayer: character.playerName ?? '',
    experience: (character.experience ?? '').toString() ?? '',
    ancestryAndHeritage: character.heritage.name ?? '',
    background: '',
    nameClass: character.path_class.name ?? '',
    size: character.ancestry.size ?? '',
    alignment: '',
    traits: (character.ancestry.traits ?? List<String>()).join(', '),
    deity: '',
    level: character.level.toString(),

  );
}

Widget generateSkillsAndLanguages(Character character) {
  return buildSkillsAndLanguages(
    acrobaticsTotal: '',
    arcanaTotal: '',
    athleticsTotal: '',
    craftingTotal: '',
    deceptionTotal: '',
    diplomacyTotal: '',
    intimidationTotal: '',
    lore1Total: '',
    lore2Total: '',
    medicineTotal: '',
    natureTotal: '',
    occultismTotal: '',
    performanceTotal: '',
    religionTotal: '',
    societyTotal: '',
    stealthTotal: '',
    survivalTotal: '',
    thieveryTotal: '',
    acrobaticsModifier: character.dexterity.modifier.toString(),
    arcanaModifier: character.intelligence.modifier.toString(),
    athleticsModifier: character.strength.modifier.toString(),
    craftingModifier: character.intelligence.modifier.toString(),
    deceptionModifier: character.charisma.modifier.toString(),
    diplomacyModifier: character.charisma.modifier.toString(),
    intimidationModifier: character.charisma.modifier.toString(),
    lore1Modifier: character.intelligence.modifier.toString(),
    lore2Modifier: character.intelligence.modifier.toString(),
    medicineModifier: character.wisdom.modifier.toString(),
    natureModifier: character.wisdom.modifier.toString(),
    occultismModifier: character.intelligence.modifier.toString(),
    performanceModifier: character.charisma.modifier.toString(),
    religionModifier: character.wisdom.modifier.toString(),
    societyModifier: character.intelligence.modifier.toString(),
    stealthModifier: character.dexterity.modifier.toString(),
    survivalModifier: character.wisdom.modifier.toString(),
    thieveryModifier: character.dexterity.modifier.toString(),
    acrobaticsProfNum: '',
    arcanaProfNum: '',
    athleticsProfNum: '',
    craftingProfNum: '',
    deceptionProfNum: '',
    diplomacyProfNum: '',
    intimidationProfNum: '',
    lore1ProfNum: '',
    lore2ProfNum: '',
    medicineProfNum: '',
    natureProfNum: '',
    occultismProfNum: '',
    performanceProfNum: '',
    religionProfNum: '',
    societyProfNum: '',
    stealthProfNum: '',
    survivalProfNum: '',
    thieveryProfNum: '',
    acrobaticsProf: 0,
    arcanaProf: 0,
    athleticsProf: 0,
    craftingProf: 0,
    deceptionProf: 0,
    diplomacyProf: 0,
    intimidationProf: 0,
    lore1Prof: 0,
    lore2Prof: 0,
    medicineProf: 0,
    natureProf: 0,
    occultismProf: 0,
    performanceProf: 0,
    religionProf: 0,
    societyProf: 0,
    stealthProf: 0,
    survivalProf: 0,
    thieveryProf: 0,
    languages: '',
  );
}

Widget generateHPPerception(Character character) {
  Proficiency perception = character.getProficiencies().singleWhere( (item) => item.proficiency_type == 'PER' && item.key_ability == 'WIS');
  return buildHPPerception(
    hpMax: (character.ancestry.hit_points + character.path_class.hit_points + character.constitution.modifier).toString(),
    hpTemp: '',
    hpCurrent: '',
    hpDying: '',
    hpWounded: '',
    resistancesAndImmunities: '',
    conditions: '',
    perTotal: (rank[perception.rank ?? '0'] + character.wisdom.modifier).toString(),
    perWis: character.wisdom.modifier.toString(),
    perProfNum: rank[perception.rank ?? '0'].toString(),
    perProf: (rank[perception.rank ?? '0']/2).floor(),
    perItem: '',
    senses: '',
  );
}

Widget generateFeatsAndFeatures(Character character){
  character.path_class = Path_Class.getClass(character.path_classId);
  character.ancestry = Ancestry.getAncestry(character.ancestryId);
  character.classFeats = character.getFeatsfromIds(character.classFeatIds);
  character.ancestryFeats = character.getFeatsfromIds(character.ancestryFeatIds);
  character.skillFeats = character.getFeatsfromIds(character.skillFeatIds);
  character.generalFeats = character.getFeatsfromIds(character.generalFeatIds);
  //Strings should only have the max length of 48
  const int _maxStringLength = 48;
  List<Feat> classFeatures = character.getClassFeatures().where((item) => item.level <= character.level && (item.name != 'Ancestry and Background' || item.name != 'Initial Proficiencies'));
  List<String> classinfo = List(20);
  List<String> skillfeats = List(20);
  List<String> generalfeats = List(20);
  List<String> ancestryfeats = List(20);
  String firstFeatureA = '';
  String firstFeatureB = '';
  String ancestryHeritage = character.heritage.name;
  String ancestrySpecial = '';
  character.ancestry.special_abilities.forEach((item) {
    if(ancestrySpecial.length == 0)
      ancestrySpecial += item;
    else if((ancestrySpecial.length + item.length + 2) < 48)
      ancestrySpecial += ", " + item;
  });
  classFeatures.forEach((item) {
    if(item.level == 1) {
      if(firstFeatureA.length == 0)
        firstFeatureA += item.name;
      else if((firstFeatureA.length + item.name.length + 2) < 48)
        firstFeatureA += ", " + item.name;
      else if(firstFeatureB.length == 0)
        firstFeatureB += item.name;
      else if((firstFeatureB.length + item.name.length + 2) < 48)
        firstFeatureB += ", " + item.name;
    }
    
  });
  classFeatures.forEach((item) {
    for(int templevel = 2; templevel < 20; templevel += 2) {
      if(item.level == (templevel+1)) {
      if(classinfo[templevel].length == 0)
        classinfo[templevel] += item.name;
      else if((classinfo[templevel].length + item.name.length + 2) < 48)
        classinfo[templevel] += ", " + item.name;
      }
    }
  });

  character.classFeats.forEach((item) {
    for(int templevel = 1; templevel < 20; templevel += 2) {
      if(item.level == (templevel+1)) {
      if(classinfo[templevel].length == 0)
        classinfo[templevel] += item.name;
      else if((classinfo[templevel].length + item.name.length + 2) < 48)
        classinfo[templevel] += ", " + item.name;
      }
    }
  });

  character.skillFeats.forEach((item) {
    for(int templevel = 1; templevel < 20; templevel += 2) {
      if(item.level == (templevel+1)) {
      if(skillfeats[templevel].length == 0)
        skillfeats[templevel] += item.name;
      else if((skillfeats[templevel].length + item.name.length + 2) < 48)
        skillfeats[templevel] += ", " + item.name;
      }
    }
  });
  character.generalFeats.forEach((item) {
    for(int templevel = 2; templevel < 20; templevel += 4) {
      if(item.level == (templevel+1)) {
      if(generalfeats[templevel].length == 0)
        generalfeats[templevel] += item.name;
      else if((generalfeats[templevel].length + item.name.length + 2) < 48)
        generalfeats[templevel] += ", " + item.name;
      }
    }
  });
  character.ancestryFeats.forEach((item) {
    for(int templevel = 0; templevel < 20; templevel += 4) {
      if(item.level == (templevel+1)) {
      if(ancestryfeats[templevel].length == 0)
        ancestryfeats[templevel] += item.name;
      else if((ancestryfeats[templevel].length + item.name.length + 2) < 48)
        ancestryfeats[templevel] += ", " + item.name;
      }
    }
  });


  return buildFeatsAndFeatures(
    skillBACKGROUND: '',
    skill2nd: skillfeats[1] ?? '',
    skill4th: skillfeats[3] ?? '',
    skill6th: skillfeats[5] ?? '',
    skill8th: skillfeats[7] ?? '',
    skill10th: skillfeats[9] ?? '',
    skill12th: skillfeats[11] ?? '',
    skill14th: skillfeats[13] ?? '',
    skill16th: skillfeats[15] ?? '',
    skill18th: skillfeats[17] ?? '',
    skill20th: skillfeats[19] ?? '',
    ancestrySPECIAL1st: ancestrySpecial ?? '',
    ancestryHERITAGE1st: ancestryHeritage ?? '',
    ancestryFEAT1st: ancestryfeats[0] ?? '',
    ancestryFEAT5th: ancestryfeats[4] ?? '',
    ancestryFEAT9th: ancestryfeats[8] ?? '',
    ancestryFEAT13th: ancestryfeats[12] ?? '',
    ancestryFEAT17th: ancestryfeats[16] ?? '',
    general3rd: generalfeats[2] ?? '',
    general7th: generalfeats[6] ?? '',
    general11th: generalfeats[10] ?? '',
    general15th: generalfeats[14] ?? '',
    general19th: generalfeats[18] ?? '',
    classFEATUREA1st: firstFeatureB ?? '',
    classFEATUREB1st: firstFeatureB ?? '',
    classFEAT1st: classinfo[0] ?? '',
    classFEAT2nd: classinfo[1] ?? '',
    classFEATURE3rd: classinfo[2] ?? '',
    classFEAT4th: classinfo[3] ?? '',
    classFEATURE5th: classinfo[4] ?? '',
    classFEAT6th: classinfo[5] ?? '',
    classFEATURE7th: classinfo[6] ?? '',
    classFEAT8th: classinfo[7] ?? '',
    classFEATURE9th: classinfo[8] ?? '',
    classFEAT10th: classinfo[9] ?? '',
    classFEATURE11th: classinfo[10] ?? '',
    classFEAT12th: classinfo[11] ?? '',
    classFEATURE13th: classinfo[12] ?? '',
    classFEAT14th: classinfo[13] ?? '',
    classFEATURE15: classinfo[14] ?? '',
    classFEAT16th: classinfo[15] ?? '',
    classFEATURE17th: classinfo[16] ?? '',
    classFEAT18th: classinfo[17] ?? '',
    classFEATURE19th: classinfo[18] ?? '',
    classFEAT20th: classinfo[19] ?? '',

  );
}

Widget generateArmorSaves(Character character) {
  List<Proficiency> proficiencies = character.getProficiencies();
  Proficiency lightArmor = proficiencies.singleWhere( (item) => item.proficiency_type == 'ARC' && item.name == 'Light Armor');
  Proficiency unarmored = proficiencies.singleWhere( (item) => item.proficiency_type == 'ARC' && item.name == 'Unarmored Defense');
  Proficiency heavyArmor = proficiencies.singleWhere( (item) => item.proficiency_type == 'ARC' && item.name == 'Heavy Armor');
  Proficiency mediumArmor = proficiencies.singleWhere( (item) => item.proficiency_type == 'ARC' && item.name == 'Medium Armor');
  Proficiency fortitude = proficiencies.singleWhere( (item) => item.proficiency_type == 'SAT' && item.key_ability == 'CON');
  Proficiency reflex = proficiencies.singleWhere( (item) => item.proficiency_type == 'SAT' && item.key_ability == 'DEX');
  Proficiency will = proficiencies.singleWhere( (item) => item.proficiency_type == 'SAT' && item.key_ability == 'WIS');
  

  return buildArmorSaves(
    armorTotal: '',
    armorDex: '',
    armorCap: '',
    armorNumProf: '',
    armorItem: '',
    unarmorProf: (rank[(unarmored.rank ?? '0')]/2).floor(),
    armorProf: 0,
    lightProf: (rank[(lightArmor.rank ?? '0')]/2).floor(),
    mediumProf: (rank[(mediumArmor.rank ?? '0')]/2).floor(),
    heavyProf: (rank[(heavyArmor.rank ?? '0')]/2).floor(),
    shield: '',
    hardness: '',
    maxHP: '',
    bT: '',
    currentHP: '',
    forNum: (rank[(fortitude.rank ?? '0')] + character.constitution.modifier).toString(),
    forCon: character.constitution.modifier.toString(),
    forNumProf: rank[(fortitude.rank ?? '0')].toString(),
    forItem: '',
    forProf: (rank[(fortitude.rank ?? '0')]/2).floor(),
    refNum: (rank[(reflex.rank ?? '0')] + character.dexterity.modifier).toString(),
    refDex: character.dexterity.modifier.toString(),
    refNumProf: rank[(reflex.rank ?? '0')].toString(),
    refItem: '',
    refProf: (rank[(reflex.rank ?? '0')]/2).floor(),
    wilNum: (rank[(will.rank ?? '0')] + character.wisdom.modifier).toString(),
    wilWis: character.wisdom.modifier.toString(),
    wilNumProf: rank[(will.rank ?? '0')].toString(),
    wilItem: '',
    wilProf: (rank[(will.rank ?? '0')]/2).floor(),

  );
}