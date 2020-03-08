import 'dart:convert';
import 'dart:io';

import 'package:hero_frontend/Models/AbilityModel.dart';
import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
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
  int classDC;

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
    this.ancestry,
    this.heritage,
    this.archetype,
    this.classFeats,
    this.ancestryFeats,
    this.skillFeats,
    this.generalFeats,
    this.level = 1,
    this.hit_poits,
    this.experience,
  });

  Proficiency getClassDCProficiency() {
    List<Proficiency> proficiencies = List();
    this.path_class.proficiencies.forEach((itemId) {
      APIservice.getProficiencyById(itemId).then((responseBody) {
        var res = jsonDecode(responseBody);
        proficiencies.add(Proficiency.fromMappedJson(res));
      });
    });

    proficiencies.forEach((item) {
      if (item.name == this.path_class.name && item.proficiency_type == 'CDC') {
        return item;
      }
    });
    return null;
  }

  File generatePDF() {
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
              buildGenericInformationRow(),
              Container(height: 2.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: buildAbilityScoresColumn(
                          strmod: '+5',
                          strsco: '20',
                          dexmod: '+2',
                          dexsco: '15',
                          conmod: '+2',
                          consco: '14',
                          intmod: '-2',
                          intsco: '8',
                          wismod: '0',
                          wissco: '11',
                          chamod: '-3',
                          chasco: '4',
                          classNum: '10',
                          key: '-2',
                          profNum: '2',
                          prof: 1,
                          item: '0',
                        )),
                    Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: buildArmorSaves(
                          armorTotal: '14',
                          armorDex: '+2',
                          armorCap: '0',
                          armorNumProf: '+2',
                          unarmorProf: 1,
                          armorProf: 1,
                          lightProf: 1,
                        )),
                    buildHPPerception()
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
              buildFeatsAndFeatures(),
            ]));
  }
}
