
import 'package:hero_frontend/Models/CharacterModel.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/PDF/pdfExample.dart';
import 'package:pdf/widgets.dart';
Map<String, int> rank = {
  'T' : 2,
  'E' : 4,
  'M' : 6,
  'L' : 8,
};

Widget generateAbilityScoresPDF(Character character){
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

Widget generateGenericInfoPDF(Character character){
  return buildGenericInformationRow(
    nameCharacter: character.name,
    namePlayer: character.playerName,
    experience: character.experience.toString(),
    ancestryAndHeritage: character.heritage.name,
    background: '',
    nameClass: character.path_class.name,
    size: character.ancestry.size,
    alignment: '',
    traits: character.ancestry.traits.join(', '),
    deity: '',
    level: character.level.toString(),

  );
}