import 'dart:convert';
import 'dart:io';

import 'package:hero_frontend/Models/AbilityModel.dart';
import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/PDF/CharacterToPDF.dart';
import 'package:hero_frontend/PDF/pdfExample.dart';
import 'package:hero_frontend/Services/apihandler.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'FeatModel.dart';

Map<String, int> rank = {
  'T': 2,
  'E': 4,
  'M': 6,
  'L': 8,
};

class Character {
  Ability strength;
  Ability dexterity;
  Ability constitution;
  Ability intelligence;
  Ability wisdom;
  Ability charisma;
  String name;
  String playerName;
  String deity;
  String alignment;
  Path_Class path_class;
  Ancestry ancestry;
  Heritage heritage;
  Archetype archetype;
  List<Feat> classFeats;
  List<Feat> ancestryFeats;
  List<Feat> skillFeats;
  List<Feat> generalFeats;
  int level;
  int hit_points;
  int experience;
  int classDC;
  int path_classId;
  int ancestryId;
  int heritageId;
  int archetypeId;
  List<int> classFeatIds;
  List<int> ancestryFeatIds;
  List<int> skillFeatIds;
  List<int> generalFeatIds;

  Character({
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
    this.name,
    this.playerName,
    this.path_class,
    this.deity,
    this.alignment,    
    this.ancestry,
    this.heritage,
    this.archetype,
    this.classFeats,
    this.ancestryFeats,
    this.skillFeats,
    this.generalFeats,
    this.level = 1,
    this.hit_points,
    this.experience,
  });

  Character.getCharacter(int id) {
    APIservice.getCharacterById(id).then((responseBody) {
      var res = jsonDecode(responseBody);
      return Character.fromMappedJson(res);
    });
  }
  Character.fromMappedJson(Map<String, dynamic> json)
      : strength=Ability(tempScore:json['strength']) ?? Ability(),
      dexterity=Ability(tempScore:json['dexterity']) ?? Ability(),
      constitution=Ability(tempScore:json['constitution']) ?? Ability(),
      intelligence=Ability(tempScore:json['intelligence']) ?? Ability(),
      wisdom=Ability(tempScore:json['wisdom']) ?? Ability(),
      charisma=Ability(tempScore:json['charisma']) ?? Ability(),
      name=json['name'] ?? '',
      playerName=json['playerName'] ?? '',
      deity=json['deity'] ?? '',
      alignment=json['alignment'] ?? '',      
      path_class=Path_Class.fromMappedJson(json['path_class'][0]) ?? Path_Class(),
      ancestry=Ancestry.fromMappedJson(json['ancestry']) ?? Ancestry(),
      heritage= Heritage.fromMappedJson(json['heritage']) ?? Heritage(),
      archetype=Archetype.fromMappedJson(json['archetype']) ?? Archetype(),
      classFeats=json['classFeats']
            .map((feat) => Feat.fromMappedJson(feat))
            .cast<Feat>()
            .toList(),
      ancestryFeats=json['ancestryFeats']
            .map((feat) => Feat.fromMappedJson(feat))
            .cast<Feat>()
            .toList(),
      skillFeats=json['skillFeats']
            .map((feat) => Feat.fromMappedJson(feat))
            .cast<Feat>()
            .toList(),
      generalFeats=json['generalFeats']
            .map((feat) => Feat.fromMappedJson(feat))
            .cast<Feat>()
            .toList(),
      level = json['level'] ?? 1,
      hit_points=json['hit_points'] ?? 0,
      experience=json['experience'] ?? 0;

  Map<String, dynamic> toJson() => {
        'strength': strength.score,
        'dexterity': dexterity.score,
        'constitution': constitution.score,
        'intelligence': intelligence.score,
        'wisdom': wisdom.score,
        'charisma': charisma.score,
        'name': name,
        'playerName': playerName,
        'deity': deity,
        'alignment': alignment,        
        'path_class': [path_class.id],
        'ancestry': ancestry.id,
        'heritage': heritage.id,
        'archetype': archetype.id,
        'classFeats': _getIdsFromFeats(classFeats),
        'ancestryFeats': _getIdsFromFeats(ancestryFeats),
        'skillFeats': _getIdsFromFeats(skillFeats),
        'generalFeats': _getIdsFromFeats(generalFeats),
        'level': level,
        'hit_points': hit_points,
        'experience': experience,
      };

  static _getIdsFromFeats(List<Feat> feats){
    if(feats == null)
      return List<Feat>();
    List<int> itemList = List();
    feats.forEach((item){
      itemList.add(item.id);
    });
    return itemList;
  }
 
  Proficiency getClassDCProficiency() {
    List<Proficiency> itemList =List();
    Future.wait(this.path_class.proficiencies.map((itemId) async {
      itemList.add(await APIservice.getProficiencyById(itemId).then((responseBody) {
        var res = jsonDecode(responseBody);
        return Proficiency.fromMappedJson(res);
      }));
      print(itemList);
    }))
    ;
    itemList.forEach((item) {
      if (item.key_ability == this.path_class.key_ability && item.proficiency_type == 'CDC')
        return item;
      return null;
    });
  }

  List<Proficiency> getProficiencies() {
    List<Proficiency> proficiencies = List();
    this.path_class.proficiencies.forEach((itemId) {
      APIservice.getProficiencyById(itemId).then((responseBody) {
        var res = jsonDecode(responseBody);
        proficiencies.add(Proficiency.fromMappedJson(res));
      });
    });
    return proficiencies;
  }
  
  List<Feat> getClassFeatures() {
    List<Feat> itemList = List();
    this.path_class.features.forEach((itemId) {

        itemList.add(Feat.getFeat(itemId));

    });
    return itemList;
  }





  Future<List<int>> generatePDF() async {
    final Document pdf = Document();
    pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(
            marginRight: 0.25 * PdfPageFormat.inch,
            marginLeft: 0.25 * PdfPageFormat.inch,
            marginTop: 0.25 * PdfPageFormat.inch,
            marginBottom: 0.125 * PdfPageFormat.inch),
        crossAxisAlignment: CrossAxisAlignment.start,
        footer: (Context context) {
          return Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
              child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                  style: Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.grey)));
        },
        build: (Context context) => <Widget>[
              generateGenericInfo(this),
              Container(height: 2.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: generateAbilityScores(this
                        )),
                    Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: generateArmorSaves(this
                        )),
                    generateHPPerception(this)
                  ]),
              Container(height: 2.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //complete width is 290 + 5 + 290 = 585
                    buildSpeedWeaponsProfs(),
                    buildSkillsAndLanguages()
                  ]),
            ]));
    pdf.addPage(MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(
            marginRight: 0.25 * PdfPageFormat.inch,
            marginLeft: 0.25 * PdfPageFormat.inch,
            marginTop: 0.25 * PdfPageFormat.inch,
            marginBottom: 0.125 * PdfPageFormat.inch),
        crossAxisAlignment: CrossAxisAlignment.start,
        footer: (Context context) {
          return Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
              child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                  style: Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.grey)));
        },
        build: (Context context) => <Widget>[
              generateFeatsAndFeatures(this),
            ]));
    return pdf.save();
  }
}
