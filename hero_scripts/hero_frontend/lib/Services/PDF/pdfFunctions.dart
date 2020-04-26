import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

int calculate() {
  return 6 * 7;
}
//NOTE This how to have wrapped columns
// Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: <Widget>[
//       //SECTION First Column
//       Expanded(
//           fit: FlexFit.loose,
//           flex: 3,
//           child: Column(children: <Widget>[
//             Paragraph(
//                 text:
//                     'The Portable Document Format (PDF) is a file format developed by Adobe in the 1990s to present documents, including text formatting and images, in a manner independent of application software, hardware, and operating systems. Based on the PostScript language, each PDF file encapsulates a complete description of a fixed-layout flat document, including the text, fonts, vector graphics, raster images and other information needed to display it. PDF was standardized as an open format, ISO 32000, in 2008, and no longer requires any royalties for its implementation.'),
//           ])),
//       Paragraph(text: '    '),
//       //SECTION Second Column
//       Expanded(
//           flex: 3,
//           child: Column(children: <Widget>[
//             Paragraph(
//                 text:
//                     'The Portable Document Format (PDF) is a file format developed by Adobe in the 1990s to present documents, including text formatting and images, in a manner independent of application software, hardware, and operating systems. Based on the PostScript language, each PDF file encapsulates a complete description of a fixed-layout flat document, including the text, fonts, vector graphics, raster images and other information needed to display it. PDF was standardized as an open format, ISO 32000, in 2008, and no longer requires any royalties for its implementation.'),
//           ])),
//     ]),

Widget buildGenericInformationRow({
  String nameCharacter,
  String namePlayer,
  String experience,
  String ancestryAndHeritage,
  String background,
  String nameClass,
  String size,
  String alignment,
  String traits,
  String deity,
  String level,
}) {
  return Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
    Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
      buildListTileBox(
        width: 170.0,
        height: 40.0,
        label: 'Character Name',
        contents: nameCharacter ?? '',
      ),
      buildListTileBox(
        width: 170.0,
        height: 30.0,
        label: 'Player Name',
        contents: namePlayer ?? '',
      ),
      buildListTileBox(
        width: 170.0,
        height: 20.0,
        label: 'Experience',
        contents: experience ?? '',
      ),
    ]),
    Column(children: <Widget>[
      buildListTileBox(
        height: 18.0,
        width: 222.0,
        label: 'Ancestry and Heritage',
        contents: ancestryAndHeritage ?? '',
      ),
      buildListTileBox(
        height: 18.0,
        width: 222.0,
        label: 'Background',
        contents: background ?? '',
      ),
      buildListTileBox(
        height: 18.0,
        width: 222.0,
        label: 'Class',
        contents: nameClass ?? '',
      ),
      Row(children: <Widget>[
        buildListTileBox(
          height: 18.0,
          width: 20.0,
          label: 'Size',
          contents: size ?? '',
        ),
        buildListTileBox(
          height: 18.0,
          width: 40.0,
          label: 'Alignment',
          contents: alignment ?? '',
        ),
        buildListTileBox(
          height: 18.0,
          width: 162.0,
          label: 'Traits',
          contents: traits ?? '',
        ),
      ]),
      buildListTileBox(
        height: 18.0,
        width: 222.0,
        label: 'Deity',
        contents: deity ?? '',
      ),
    ]),
    Padding(
        padding: EdgeInsets.only(left: 5.0),
        child: Column(children: <Widget>[
          Container(
              height: 30.0,
              width: 70.0,
              decoration: BoxDecoration(color: PdfColors.black),
              child: Expanded(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('LEVEL',
                          textScaleFactor: 1.5,
                          style: TextStyle(color: PdfColors.white))))),
          Container(
              height: 30.0,
              width: 70.0,
              decoration: BoxDecoration(
                  border: BoxBorder(
                      top: true,
                      right: true,
                      left: true,
                      bottom: true,
                      width: 1.0,
                      color: PdfColors.black)),
              child: Expanded(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text(level ?? '',
                          textScaleFactor: 1.5,
                          style: TextStyle(color: PdfColors.black))))),
          Container(
              height: 10.0,
              width: 70.0,
              child: Expanded(
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('Hero Points',
                          style: TextStyle(
                              color: PdfColors.black,
                              fontSize: 8.0,
                              fontWeight: FontWeight.bold))))),
          Container(
            height: 20.0,
            width: 70.0,
            decoration: BoxDecoration(
                border: BoxBorder(
                    top: true,
                    right: true,
                    left: true,
                    bottom: true,
                    width: 1.0,
                    color: PdfColors.black)),
          ),
        ]))
  ]);
}

Widget buildListTileBox(
    {double width,
    double height,
    PdfColor backgroundColor,
    String label,
    String contents}) {
  return Container(
    width: width ?? 120.0,
    height: height ?? 25.0,
    padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
    decoration: BoxDecoration(
        color: backgroundColor ?? PdfColors.white,
        border: BoxBorder(
            top: true,
            right: true,
            left: true,
            bottom: true,
            width: 1.0,
            color: PdfColors.black)),
    child: Expanded(
      child: Column(children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(label.toUpperCase() ?? 'Left Null',
              style: TextStyle(
                fontSize: 6.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Text(contents ?? 'Left Null',
                style: TextStyle(
                  fontSize: 7.0,
                )))
      ]),
    ),
  );
}
/*buildBox(
        width: width,
        fontSize: 12.0,
        height: 17.0,
        backgroundColor: PdfColors.black,
        textColor: PdfColors.white,
        label: 'Ability Scores',
      ), */

Widget buildLabeledBox(
    {double width,
    double height,
    double fontSize,
    String label,
    PdfColor backgroundColor,
    PdfColor labelColor,
    PdfColor textColor,
    Widget child,
    BoxBorder border}) {
  return Container(
    width: width ?? 120.0,
    height: height ?? 48.0,
    decoration: BoxDecoration(
      color: backgroundColor ?? PdfColors.white,
    ),
    child: Column(children: <Widget>[
      Container(
          width: width ?? 120.0,
          height: 17.0,
          decoration: BoxDecoration(
              border: border, color: labelColor ?? PdfColors.black),
          child: Expanded(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(label.toUpperCase() ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize ?? 12.0,
                          color: textColor ?? PdfColors.white))))),
      Container(
          height: (height != null) ? height - 17.0 : 31.0,
          width: width ?? 120.0,
          child: SizedBox.expand(child: child))
    ]),
  );
}

Widget buildBox(
    {double width,
    double height,
    double fontSize,
    String label,
    PdfColor backgroundColor,
    PdfColor textColor,
    bool noBox}) {
  return Container(
    width: width ?? 120.0,
    height: height ?? 25.0,
    padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
    decoration: BoxDecoration(
        color: backgroundColor ?? PdfColors.white,
        border: (noBox != null && noBox != true)
            ? BoxBorder(
                top: true,
                right: true,
                left: true,
                bottom: true,
                width: 1.0,
                color: PdfColors.black)
            : BoxBorder()),
    child: Expanded(
      child: Column(children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text(label.toUpperCase() ?? 'Left Null',
              style: TextStyle(
                color: textColor ?? PdfColors.black,
                fontSize: fontSize ?? 6.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left),
        ),
      ]),
    ),
  );
}

Widget buildNumberBox({double height, double width, String number}) {
  return Container(
      height: height ?? 18.0,
      width: width ?? 26.0,
      decoration: BoxDecoration(
          border: BoxBorder(
              top: true,
              right: true,
              left: true,
              bottom: true,
              width: 1.0,
              color: PdfColors.black),
          color: PdfColors.white),
      child: Expanded(
          child: Align(
              alignment: Alignment.center,
              child: Text(number ?? '', textScaleFactor: 1.3))));
}

Widget buildWidgetBox({double height, double width, Widget contents}) {
  return Container(
      height: height ?? 18.0,
      width: width ?? 26.0,
      decoration: BoxDecoration(
          border: BoxBorder(
              top: true,
              right: true,
              left: true,
              bottom: true,
              width: 1.0,
              color: PdfColors.black),
          color: PdfColors.white),
      child: SizedBox.expand(child: contents));
}

Widget buildAbilityModifierLabel({String ability}) {
  return Container(
      height: 20.0,
      width: 35.0,
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(children: <Widget>[
        Expanded(
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(ability.toUpperCase() ?? 'Left Null',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8.0,
                        color: PdfColors.white)))),
        Expanded(
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('MODIFIER',
                    style: TextStyle(
                        fontSize: 5.0,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.white))))
      ]));
}

Widget buildAbilityScoreLabel({String ability}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      width: 80.0,
      height: 20.0,
      child: Column(children: <Widget>[
        Expanded(
            child: Align(
                alignment: Alignment.topRight,
                child: Text(ability.toUpperCase() ?? 'Left Null',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8.0,
                        color: PdfColors.white)))),
        Expanded(
            child: Align(
                alignment: Alignment.topRight,
                child: Text('SCORE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 5.0,
                        color: PdfColors.white))))
      ]));
}

Widget buildAbilityRow(
    {String modiferNum, String scoreNum, String modifierLab, String scoreLab}) {
  return Container(
      padding: EdgeInsets.only(bottom: 2.0),
      child: Row(children: <Widget>[
        buildNumberBox(number: modiferNum),
        buildAbilityModifierLabel(ability: modifierLab),
        buildAbilityScoreLabel(ability: scoreLab),
        buildNumberBox(number: scoreNum),
      ]));
}

Widget buildDCBase() {
  return Container(
      height: 18.0,
      width: 26.0,
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      child: Row(children: <Widget>[
        Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('=',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8.0,
                        color: PdfColors.white)))),
        Column(children: <Widget>[
          Container(
              height: 6.0,
              child: Expanded(
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Text('DC BASE',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 5.0,
                              color: PdfColors.white))))),
          Expanded(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text('10',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                          color: PdfColors.white))))
        ])
      ]));
}

Widget buildFeatsAndFeatures({
String skillBACKGROUND,
String skill2nd,
String skill4th,
String skill6th,
String skill8th,
String skill10th,
String skill12th,
String skill14th,
String skill16th,
String skill18th,
String skill20th,
String ancestrySPECIAL1st,
String ancestryHERITAGE1st,
String ancestryFEAT1st,
String ancestryFEAT5th,
String ancestryFEAT9th,
String ancestryFEAT13th,
String ancestryFEAT17th,
String general3rd,
String general7th,
String general11th,
String general15th,
String general19th,
String classFEATUREA1st,
String classFEATUREB1st,
String classFEAT1st,
String classFEAT2nd,
String classFEATURE3rd,
String classFEAT4th,
String classFEATURE5th,
String classFEAT6th,
String classFEATURE7th,
String classFEAT8th,
String classFEATURE9th,
String classFEAT10th,
String classFEATURE11th,
String classFEAT12th,
String classFEATURE13th,
String classFEAT14th,
String classFEATURE15,
String classFEAT16th,
String classFEATURE17th,
String classFEAT18th,
String classFEATURE19th,
String classFEAT20th,
}) {
  return Row(children: <Widget>[
                    //complete width is 290 + 5 + 290 = 585
                    Column(children: <Widget>[
                      buildLabeledBox(
                          width: 290.0,
                          height: 132.0,
                          backgroundColor: PdfColors.grey,
                          label: 'Ancestry Feats and Abilities',
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                buildFeatureRow(nameFeature: ancestrySPECIAL1st ?? '',indexFeature: 'SPECIAL 1st'),
                                buildFeatureRow(nameFeature: ancestryHERITAGE1st ?? '',indexFeature: 'HERITAGE 1st'),
                                buildFeatureRow(nameFeature: ancestryFEAT1st ?? '',indexFeature: 'FEAT 1st'),
                                buildFeatureRow(nameFeature: ancestryFEAT5th ?? '',indexFeature: 'FEAT 5th'),
                                buildFeatureRow(nameFeature: ancestryFEAT9th ?? '',indexFeature: 'FEAT 9th'),
                                buildFeatureRow(nameFeature: ancestryFEAT13th ?? '',indexFeature: 'FEAT 13th'),
                                buildFeatureRow(nameFeature: ancestryFEAT17th ?? '',indexFeature: 'FEAT 17th'),
                              ])),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: buildLabeledBox(
                            width: 290.0,
                            height: 196.0,
                            backgroundColor: PdfColors.grey,
                            label: 'Skill Feats',
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  buildFeatureRow(nameFeature: skillBACKGROUND ?? '', indexFeature: 'BACKGROUND'),
                                  buildFeatureRow(nameFeature: skill2nd ?? '', indexFeature: '2nd'),
                                  buildFeatureRow(nameFeature: skill4th ?? '', indexFeature: '4th'),
                                  buildFeatureRow(nameFeature: skill6th ?? '', indexFeature: '6th'),
                                  buildFeatureRow(nameFeature: skill8th ?? '', indexFeature: '8th'),
                                  buildFeatureRow(nameFeature: skill10th ?? '', indexFeature: '10th'),
                                  buildFeatureRow(nameFeature: skill12th ?? '', indexFeature: '12th'),
                                  buildFeatureRow(nameFeature: skill14th ?? '', indexFeature: '14th'),
                                  buildFeatureRow(nameFeature: skill16th ?? '', indexFeature: '16th'),
                                  buildFeatureRow(nameFeature: skill18th ?? '', indexFeature: '18th'),
                                  buildFeatureRow(nameFeature: skill20th ?? '', indexFeature: '20th'),
                                ])),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: buildLabeledBox(
                            width: 290.0,
                            height: 100.0,
                            backgroundColor: PdfColors.grey,
                            label: 'General Feats',
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  buildFeatureRow(nameFeature: general3rd ?? '', indexFeature: '3rd'),
                                  buildFeatureRow(nameFeature: general7th ?? '', indexFeature: '7th'),
                                  buildFeatureRow(nameFeature: general11th ?? '', indexFeature: '11th'),
                                  buildFeatureRow(nameFeature: general15th ?? '', indexFeature: '15th'),
                                  buildFeatureRow(nameFeature: general19th ?? '', indexFeature: '19th'),
                                ])),
                      )
                    ]),
                    Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Column(children: <Widget>[
                          buildLabeledBox(
                              width: 290.0,
                              height: 375.0,
                              backgroundColor: PdfColors.grey,
                              label: 'Class Feats and Abilities',
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    buildFeatureRow(nameFeature: classFEATUREA1st ?? '',indexFeature: 'FEATURE 1st'),
                                    buildFeatureRow(nameFeature: classFEATUREB1st ?? '',indexFeature: 'FEATURE 1st'),
                                    buildFeatureRow(nameFeature: classFEAT1st ?? '',indexFeature: 'FEAT 1st'),
                                    buildFeatureRow(nameFeature: classFEAT2nd ?? '',indexFeature: 'FEAT 2nd'),
                                    buildFeatureRow(nameFeature: classFEATURE3rd ?? '',indexFeature: 'FEATURE 3rd'),
                                    buildFeatureRow(nameFeature: classFEAT4th ?? '',indexFeature: 'FEAT 4th'),
                                    buildFeatureRow(nameFeature: classFEATURE5th ?? '',indexFeature: 'FEATURE 5th'),
                                    buildFeatureRow(nameFeature: classFEAT6th ?? '',indexFeature: 'FEAT 6th'),
                                    buildFeatureRow(nameFeature: classFEATURE7th ?? '',indexFeature: 'FEATURE 7th'),
                                    buildFeatureRow(nameFeature: classFEAT8th ?? '',indexFeature: 'FEAT 8th'),
                                    buildFeatureRow(nameFeature: classFEATURE9th ?? '',indexFeature: 'FEATURE 9th'),
                                    buildFeatureRow(nameFeature: classFEAT10th ?? '',indexFeature: 'FEAT 10th'),
                                    buildFeatureRow(nameFeature: classFEATURE11th ?? '',indexFeature: 'FEATURE 11th'),
                                    buildFeatureRow(nameFeature: classFEAT12th ?? '',indexFeature: 'FEAT 12th'),
                                    buildFeatureRow(nameFeature: classFEATURE13th ?? '',indexFeature: 'FEATURE 13th'),
                                    buildFeatureRow(nameFeature: classFEAT14th ?? '',indexFeature: 'FEAT 14th'),
                                    buildFeatureRow(nameFeature: classFEATURE15 ?? '',indexFeature: 'FEATURE 15'),
                                    buildFeatureRow(nameFeature: classFEAT16th ?? '',indexFeature: 'FEAT 16th'),
                                    buildFeatureRow(nameFeature: classFEATURE17th ?? '',indexFeature: 'FEATURE 17th'),
                                    buildFeatureRow(nameFeature: classFEAT18th ?? '',indexFeature: 'FEAT 18th'),
                                    buildFeatureRow(nameFeature: classFEATURE19th ?? '',indexFeature: 'FEATURE 19th'),
                                    buildFeatureRow(nameFeature: classFEAT20th ?? '',indexFeature: 'FEAT 20th'),
                                  ])),
                          Padding(
                              padding: EdgeInsets.only(top: 2.0),
                              child: buildLabeledBox(
                                  width: 290.0,
                                  height: 55.0,
                                  backgroundColor: PdfColors.grey,
                                  label: 'BONUS Feats',
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        buildFeatureRow(
                                            nameFeature: '', indexFeature: ''),
                                        buildFeatureRow(
                                            nameFeature: '', indexFeature: ''),
                                      ]))),
                        ])),
                  ]);
  
  
}



Widget buildAbilityScoresColumn({
  String strmod,
  String strsco,
  String dexmod,
  String dexsco,
  String conmod,
  String consco,
  String intmod,
  String intsco,
  String wismod,
  String wissco,
  String chamod,
  String chasco,
  String classNum,
  String key,
  String profNum,
  int prof,
  String item,
}) {
  double width = 173.0;
  return Column(
    children: <Widget>[
      buildBox(
        width: width,
        fontSize: 12.0,
        height: 17.0,
        backgroundColor: PdfColors.black,
        textColor: PdfColors.white,
        label: 'Ability Scores',
      ),
      Container(
          height: 139.0,
          width: width,
          decoration: BoxDecoration(
            color: PdfColors.grey,
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
              child: Column(children: <Widget>[
                buildAbilityRow(
                    modiferNum: strmod ?? '',
                    modifierLab: 'STR',
                    scoreLab: 'STRENGTH',
                    scoreNum: strsco ?? ''),
                buildAbilityRow(
                    modiferNum: dexmod ?? '',
                    modifierLab: 'DEX',
                    scoreLab: 'dexterity',
                    scoreNum: dexsco ?? ''),
                buildAbilityRow(
                    modiferNum: conmod ?? '',
                    modifierLab: 'CON',
                    scoreLab: 'Constitution',
                    scoreNum: consco ?? ''),
                buildAbilityRow(
                    modiferNum: intmod ?? '',
                    modifierLab: 'INT',
                    scoreLab: 'Intelligence',
                    scoreNum: intsco ?? ''),
                buildAbilityRow(
                    modiferNum: wismod ?? '',
                    modifierLab: 'WIS',
                    scoreLab: 'WISDOM',
                    scoreNum: wissco ?? ''),
                buildAbilityRow(
                    modiferNum: chamod ?? '',
                    modifierLab: 'CHA',
                    scoreLab: 'CHarisma',
                    scoreNum: chasco ?? ''),
              ]))),
      buildBox(
        width: width,
        fontSize: 12.0,
        height: 17.0,
        backgroundColor: PdfColors.black,
        textColor: PdfColors.white,
        label: 'Class DC',
      ),
      Container(
          height: 26.0,
          width: width,
          decoration: BoxDecoration(
            color: PdfColors.grey,
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    buildNumberBox(number: classNum ?? ''),
                    buildDCBase(),
                    buildLabeledNumberBox(label: 'key', number: key ?? ''),
                    buildLabeledNumberBox(label: 'Prof', number: profNum ?? ''),
                    buildProficiencyRow(prof: prof ?? 0),
                    buildLabeledNumberBox(label: 'item', number: item ?? ''),
                  ]))),
    ],
  );
}

Widget buildProficiencyRow({int prof}) {
  return Row(children: <Widget>[
    buildProficiencyRank(rank: 'T', enabled: prof == 1 ? true : false),
    buildProficiencyRank(rank: 'E', enabled: prof == 2 ? true : false),
    buildProficiencyRank(rank: 'M', enabled: prof == 3 ? true : false),
    buildProficiencyRank(rank: 'L', enabled: prof == 4 ? true : false),
  ]);
}

Widget buildProficiencyRank({String rank, bool enabled}) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
          height: 15.0,
          width: 8.0,
          decoration: BoxDecoration(
              color: PdfColors.white,
              border: BoxBorder(
                  top: true,
                  right: true,
                  left: true,
                  bottom: true,
                  width: 1.0,
                  color: PdfColors.black)),
          child: Column(children: <Widget>[
            Container(
                width: 8.0,
                height: 7.0,
                decoration: BoxDecoration(color: PdfColors.black),
                child: Expanded(
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(rank.toUpperCase() ?? '',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 6.0,
                                color: PdfColors.white))))),
            Container(
                width: 8.0,
                height: 8.0,
                child: Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(enabled ? 'X' : '',
                            style: TextStyle(
                                fontSize: 8.0,
                                fontWeight: FontWeight.bold,
                                color: PdfColors.black)))))
          ])));
}

Widget buildLabeledNumberBox(
    {double fixedLabelHeight,
    double height,
    double width,
    double fontSize,
    String label,
    String number}) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
          height: height ?? 18.0,
          width: width ?? 24.0,
          decoration: BoxDecoration(
              color: PdfColors.white,
              border: BoxBorder(
                  top: true,
                  right: true,
                  left: true,
                  bottom: true,
                  width: 1.0,
                  color: PdfColors.black)),
          child: Column(children: <Widget>[
            Container(
                width: width ?? 24.0,
                height: (fixedLabelHeight == null)
                    ? ((height != null) ? height / 3 : 6.0)
                    : fixedLabelHeight,
                decoration: BoxDecoration(color: PdfColors.black),
                child: Expanded(
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(label.toUpperCase() ?? 'KEY',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    (fontSize != null) ? fontSize / 2 : 5.0,
                                color: PdfColors.white))))),
            Container(
                width: width ?? 24.0,
                height: (fixedLabelHeight == null)
                    ? ((height != null) ? (height / 3) * 2 : 12.0)
                    : height - fixedLabelHeight,
                child: Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(number ?? '',
                            style: TextStyle(
                                fontSize: fontSize ?? 10.0, color: PdfColors.black)))))
          ])));
}

Widget buildLabeledSmallCheckbox({String label, bool enabled}) {
  return Container(
      height: 10.0,
      width: 8.0,
      child: Column(children: <Widget>[
        Expanded(
            child: Align(
                alignment: Alignment.topCenter,
                child: Text(label.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 5.0,
                        color: PdfColors.white)))),
        Container(
            height: 5.0,
            width: 5.0,
            decoration: BoxDecoration(
                color: PdfColors.white,
                border: BoxBorder(
                    top: true,
                    right: true,
                    left: true,
                    bottom: true,
                    width: 0.5,
                    color: PdfColors.black)),
            child: Expanded(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(enabled ? 'X' : '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 5.0,
                            color: PdfColors.black)))))
      ]));
}

Widget buildSmallCheckbox({bool enabled}) {
  return Container(
      height: 5.0,
      width: 5.0,
      decoration: BoxDecoration(
          color: PdfColors.white,
          border: BoxBorder(
              top: true,
              right: true,
              left: true,
              bottom: true,
              width: 0.5,
              color: PdfColors.black)),
      child: SizedBox.expand(
          child: Align(
              alignment: Alignment.topCenter,
              child: Text((enabled != null && enabled) ? 'X' : '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 5.0,
                      color: PdfColors.black)))));
}

Widget buildSavingThrow(
    {String label,
    String totalMod,
    String ability,
    String modifer,
    String profNum,
    String item,
    int prof}) {
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
    buildBox(
        width: 76.0,
        height: 14.0,
        backgroundColor: PdfColors.grey,
        textColor: PdfColors.white,
        label: label ?? '',
        noBox: true,
        fontSize: 10.0),
    buildNumberBox(number: (int.parse(totalMod) > 0 ? ('+' + totalMod) : totalMod) ?? ''),
    Padding(
        padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
        child: Row(children: <Widget>[
          buildLabeledNumberBox(label: ability ?? '', number: modifer ?? '0'),
          Padding(padding: EdgeInsets.only(right: 13.0)),
          buildLabeledNumberBox(label: 'PROF', number: profNum ?? '0'),
        ])),
    Row(children: <Widget>[
      buildLabeledNumberBox(label: 'ITEM', number: item ?? '0'),
      buildProficiencyRow(prof: prof ?? 0),
    ]),
  ]);
}

Widget buildHPPerception({
  String hpMax,
  String hpTemp,
  String hpCurrent,
  String hpDying,
  String hpWounded,
  String resistancesAndImmunities,
  String conditions,
  String perTotal,
  String perWis,
  String perProfNum,
  int perProf,
  String perItem,
  String senses,
}) {
  return Column(children: <Widget>[
    buildLabeledBox(
        width: 156.0,
        height: 138.0,
        label: 'Hit points',
        backgroundColor: PdfColors.grey,
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Row(children: <Widget>[
              buildLabeledNumberBox(
                  fontSize: 12.0,
                  label: 'Max',
                  width: 30.0,
                  height: 26.0,
                  number: hpMax ?? ''),
              buildLabeledNumberBox(
                  fontSize: 12.0,
                  label: 'Temporary',
                  width: 120.0,
                  height: 26.0,
                  number: hpTemp ?? ''),
            ]),
          ),
          Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Row(children: <Widget>[
                buildLabeledNumberBox(
                    fontSize: 12.0,
                    label: 'Current',
                    width: 100.0,
                    height: 35.0,
                    fixedLabelHeight: (26.0 / 3),
                    number: hpCurrent ?? ''),
                buildLabeledNumberBox(
                    fixedLabelHeight: 6.0,
                    label: 'Dying',
                    height: 35.0,
                    width: 20.0,
                    number: hpDying ?? ''),
                buildLabeledNumberBox(
                    fixedLabelHeight: 6.0,
                    label: 'Wounded',
                    height: 35.0,
                    width: 28.0,
                    number: hpWounded ?? '')
              ])),
          Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: buildListTileBox(
                label: 'Resistances and Immunities',
                contents: resistancesAndImmunities ?? '',
                width: 150.0,
                height: 25.0,
              )),
          Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: buildListTileBox(
                  width: 150.0,
                  height: 25.0,
                  label: 'Conditions',
                  contents: conditions ?? ''))
        ])),
    buildLabeledBox(
        width: 156.0,
        height: 60.0,
        label: 'Perception',
        backgroundColor: PdfColors.grey,
        child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildNumberBox(number: (int.parse(perTotal) > 0 ? ('+' + perTotal) : perTotal)  ?? ''),
                    Container(
                        height: 18.0,
                        width: 6.0,
                        padding: EdgeInsets.symmetric(horizontal: 1.0),
                        child: Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('=',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8.0,
                                        color: PdfColors.white))))),
                    buildLabeledNumberBox(label: 'WIS', number: perWis ?? ''),
                    buildLabeledNumberBox(
                        label: 'Prof', number: perProfNum ?? ''),
                    buildProficiencyRow(prof: perProf ?? 0),
                    buildLabeledNumberBox(label: 'item', number: perItem ?? ''),
                  ])),
          Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: buildListTileBox(
                  width: 150.0,
                  height: 19.0,
                  label: 'Senses',
                  contents: senses ?? ''))
        ]))
  ]);
}

Widget buildArmorSaves({
  String armorTotal,
  String armorDex,
  String armorCap,
  String armorNumProf,
  String armorItem,
  int unarmorProf,
  int armorProf,
  int lightProf,
  int mediumProf,
  int heavyProf,
  String shield,
  String hardness,
  String maxHP,
  String bT,
  String currentHP,
  String forNum,
  String forCon,
  String forNumProf,
  String forItem,
  int forProf,
  String refNum,
  String refDex,
  String refNumProf,
  String refItem,
  int refProf,
  String wilNum,
  String wilWis,
  String wilNumProf,
  String wilItem,
  int wilProf,
}) {
  return Column(children: <Widget>[
    buildBox(
      width: 236.0,
      fontSize: 12.0,
      height: 17.0,
      backgroundColor: PdfColors.black,
      textColor: PdfColors.white,
      label: 'Armor Class',
    ),
    Container(
      width: 237.0,
      height: 69.0,
      decoration: BoxDecoration(
        color: PdfColors.grey,
      ),
      child: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <
                Widget>[
              buildNumberBox(number: armorTotal),
              buildDCBase(),
              buildLabeledNumberBox(label: 'DEX', number: armorDex ?? '0'),
              buildLabeledNumberBox(label: 'CAP', number: armorCap ?? '0'),
              buildLabeledNumberBox(label: 'Prof', number: armorNumProf ?? '0'),
              buildProficiencyRow(prof: armorProf ?? 0),
              buildLabeledNumberBox(label: 'item', number: armorItem ?? '0'),
            ])),
        Padding(
            padding: EdgeInsets.only(left: 45.0),
            child: Row(children: <Widget>[
              buildArmorProficiency(label: 'unarmored', prof: unarmorProf ?? 0),
              buildArmorProficiency(label: 'Light', prof: lightProf ?? 0),
              buildArmorProficiency(label: 'medium', prof: mediumProf ?? 0),
              buildArmorProficiency(label: 'heavy', prof: heavyProf ?? 0),
            ])),
        Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Container(
              height: 3.0,
              width: 194.0,
              decoration: BoxDecoration(
                  border: BoxBorder(
                      bottom: true, width: 2.0, color: PdfColors.white)),
            )),
        Padding(
            padding: EdgeInsets.only(top: 5.0, left: 45.0),
            child: Row(children: <Widget>[
              buildLabeledNumberBox(
                width: 25.0,
                //fontSize: 12.0,
                number: shield ?? '',
                label: 'shield',
              ),
              buildLabeledNumberBox(
                width: 35.0,
                //fontSize: 12.0,
                number: hardness ?? '',
                label: 'Hardness',
              ),
              buildLabeledNumberBox(
                width: 25.0,
                //fontSize: 12.0,
                number: maxHP ?? '',
                label: 'Max HP',
              ),
              buildLabeledNumberBox(
                width: 15.0,
                //fontSize: 12.0,
                number: bT ?? '',
                label: 'BT',
              ),
              buildLabeledNumberBox(
                width: 35.0,
                //fontSize: 12.0,
                number: currentHP ?? '',
                label: 'Current HP',
              ),
            ])),
      ]),
    ),
    buildBox(
      width: 236.0,
      fontSize: 12.0,
      height: 17.0,
      backgroundColor: PdfColors.black,
      textColor: PdfColors.white,
      label: 'Saving Throws',
    ),
    Container(
        width: 237.0,
        height: 96.0,
        decoration: BoxDecoration(
          color: PdfColors.grey,
        ),
        child: Row(children: <Widget>[
          buildSavingThrow(
            label: 'Fortitude',
            ability: 'CON',
            totalMod: forNum ?? '',
            modifer: forCon ?? '',
            profNum: forNumProf ?? '',
            prof: forProf ?? 0,
            item: forItem ?? '',
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                  width: 3.0,
                  height: 66.0,
                  decoration: BoxDecoration(
                      border: BoxBorder(
                          left: true, width: 2.0, color: PdfColors.white)))),
          buildSavingThrow(
            label: 'Reflex',
            ability: 'DEX',
            totalMod: refNum ?? '',
            modifer: refDex ?? '',
            profNum: refNumProf ?? '',
            prof: refProf ?? 0,
            item: refItem ?? '',
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Container(
                  width: 3.0,
                  height: 66.0,
                  decoration: BoxDecoration(
                      border: BoxBorder(
                          left: true, width: 2.0, color: PdfColors.white)))),
          buildSavingThrow(
            label: 'WILL',
            ability: 'WIS',
            totalMod: wilNum ?? '',
            modifer: wilWis ?? '',
            profNum: wilNumProf ?? '',
            prof: wilProf ?? 0,
            item: wilItem ?? '',
          ),
        ]))
  ]);
}

Widget buildArmorProficiency({String label, int prof}) {
  /*
        Used an int to define what level of proficiency
        0 = mark nothing
        1 = trained
        2 = expert
        3 = master
        4 = legendary
       */
  return Container(
      height: 15.0,
      width: 35.0,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(label.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 5.0,
                            color: PdfColors.white)))),
            Row(children: <Widget>[
              buildLabeledSmallCheckbox(
                  label: 'T', enabled: prof == 1 ? true : false),
              buildLabeledSmallCheckbox(
                  label: 'E', enabled: prof == 2 ? true : false),
              buildLabeledSmallCheckbox(
                  label: 'M', enabled: prof == 3 ? true : false),
              buildLabeledSmallCheckbox(
                  label: 'L', enabled: prof == 4 ? true : false),
            ])
          ]));
}

Widget buildSpeedAndMovement({String speed, String notes}) {
  return Container(
      width: 290.0,
      height: 24.0,
      decoration: BoxDecoration(color: PdfColors.black),
      child: SizedBox.expand(
          child: Row(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: Text('speed'.toUpperCase(),
                style: TextStyle(
                    color: PdfColors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold))),
        buildNumberBox(height: 20.0, width: 40.0, number: speed ?? ''),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            child: Text('feet'.toUpperCase(),
                style: TextStyle(
                    color: PdfColors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold))),
        buildListTileBox(
          height: 23.0,
          width: 169.0,
          label: 'Movement types & notes'.toUpperCase(),
          contents: notes ?? '',
        )
      ])));
}

Widget buildWeaponTypeBoxes({int weapontype}) {
  /* 
  Weapon type is an integer where each number represents a combination
    1 = bludgeoning
    2 = piercing
    4 = slashing
    example:
      1 + 2 = 3, therefore a weapon is both bludgeoning and piercing
  */
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(children: <Widget>[
        Row(children: <Widget>[
          buildSmallCheckbox(
              enabled: (weapontype != null &&
                      (weapontype == 1 ||
                          weapontype == 3 ||
                          weapontype == 5 ||
                          weapontype == 7))
                  ? true
                  : false),
          Padding(
              padding: EdgeInsets.only(left: 1.0),
              child: Text('b'.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 5.0,
                      color: PdfColors.white))),
        ]),
        Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0),
            child: Row(children: <Widget>[
              buildSmallCheckbox(
                  enabled: (weapontype != null &&
                          (weapontype == 2 ||
                              weapontype == 3 ||
                              weapontype == 6 ||
                              weapontype == 7))
                      ? true
                      : false),
              Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Text('p'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 5.0,
                          color: PdfColors.white))),
            ])),
        Row(children: <Widget>[
          buildSmallCheckbox(
              enabled: (weapontype != null &&
                      (weapontype == 4 ||
                          weapontype == 5 ||
                          weapontype == 6 ||
                          weapontype == 7))
                  ? true
                  : false),
          Padding(
              padding: EdgeInsets.only(left: 1.0),
              child: Text('s'.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 5.0,
                      color: PdfColors.white))),
        ])
      ]));
}

Widget buildWeaponStrikes({
  String nameWeapon,
  String attackRoll,
  String abilityType,
  String abilityMod,
  String attackProfNum,
  int attackProf,
  String attackItem,
  String damageDice,
  int weapontype,
  String weaponSpec,
  String other,
  String traits,
}) {
  return Column(children: <Widget>[
    Padding(
        padding: EdgeInsets.only(top: 2.0),
        child: Row(children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: buildListTileBox(
                height: 22.0,
                width: 120.0,
                label: 'Weapon'.toUpperCase(),
                contents: nameWeapon ?? '',
              )),
          buildNumberBox(number: attackRoll ?? ''),
          Container(
              height: 18.0,
              width: 6.0,
              padding: EdgeInsets.symmetric(horizontal: 1.0),
              child: Expanded(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('=',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.0,
                              color: PdfColors.white))))),
          buildLabeledNumberBox(
              label: abilityType ?? '', number: abilityMod ?? ''),
          buildLabeledNumberBox(label: 'PROF', number: attackProfNum ?? ''),
          buildProficiencyRow(prof: attackProf ?? 0),
          buildLabeledNumberBox(label: 'item', number: attackItem ?? ''),
        ])),
    Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
        child: Row(children: <Widget>[
          buildLabeledNumberBox(label: 'DICE', number: damageDice ?? ''),
          buildLabeledNumberBox(
              label: abilityType ?? '', number: abilityMod ?? ''),
          buildWeaponTypeBoxes(weapontype: weapontype ?? 0),
          buildLabeledNumberBox(label: 'W SPEC', number: weaponSpec ?? ''),
          buildLabeledNumberBox(
              label: 'other', number: other ?? '', width: 75.0),
          buildLabeledNumberBox(
              label: 'traits', number: traits ?? '', width: 105.0)
        ]))
  ]);
}

Widget buildSpeedWeaponsProfs() {
  return Column(children: <Widget>[
    buildSpeedAndMovement(),
    Padding(
        padding: EdgeInsets.only(top: 2.0),
        child: buildLabeledBox(
            width: 290.0,
            height: 166.0,
            label: 'Melee Strikes'.toUpperCase(),
            backgroundColor: PdfColors.grey,
            child: Column(children: <Widget>[
              buildWeaponStrikes(abilityType: 'STR'),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    height: 2.0,
                    width: 280.0,
                    decoration: BoxDecoration(
                        border: BoxBorder(
                            top: true, width: 1.0, color: PdfColors.white)),
                  )),
              buildWeaponStrikes(abilityType: 'STR'),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    height: 2.0,
                    width: 280.0,
                    decoration: BoxDecoration(
                        border: BoxBorder(
                            top: true, width: 1.0, color: PdfColors.white)),
                  )),
              buildWeaponStrikes(abilityType: 'STR'),
            ]))),
    Padding(
        padding: EdgeInsets.only(top: 2.0),
        child: buildLabeledBox(
            width: 290.0,
            height: 166.0,
            label: 'Ranged Strikes'.toUpperCase(),
            backgroundColor: PdfColors.grey,
            child: Column(children: <Widget>[
              buildWeaponStrikes(abilityType: 'DEX'),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    height: 2.0,
                    width: 280.0,
                    decoration: BoxDecoration(
                        border: BoxBorder(
                            top: true, width: 1.0, color: PdfColors.white)),
                  )),
              buildWeaponStrikes(abilityType: 'DEX'),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    height: 2.0,
                    width: 280.0,
                    decoration: BoxDecoration(
                        border: BoxBorder(
                            top: true, width: 1.0, color: PdfColors.white)),
                  )),
              buildWeaponStrikes(abilityType: 'DEX'),
            ]))),
    Padding(
        padding: EdgeInsets.only(top: 2.0),
        child: buildLabeledBox(
            width: 290.0,
            height: 37.0,
            label: 'Weapon Proficiencies'.toUpperCase(),
            backgroundColor: PdfColors.grey,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildArmorProficiency(label: 'Simple'.toUpperCase(), prof: 0),
                  buildArmorProficiency(
                      label: 'Martial'.toUpperCase(), prof: 0),
                  buildArmorProficiency(label: 'Other'.toUpperCase(), prof: 0),
                  buildNumberBox(height: 16.0, width: 70.0, number: 'test'),
                  Padding(
                      padding: EdgeInsets.only(left: 2.0),
                      child: buildArmorProficiency(
                          label: 'Other'.toUpperCase(), prof: 0)),
                  buildNumberBox(height: 16.0, width: 70.0, number: 'test'),
                ]))),
  ]);
}

Widget buildSkillsAndLanguages({
  String acrobaticsTotal,
  String arcanaTotal,
  String athleticsTotal,
  String craftingTotal,
  String deceptionTotal,
  String diplomacyTotal,
  String intimidationTotal,
  String lore1Total,
  String lore2Total,
  String medicineTotal,
  String natureTotal,
  String occultismTotal,
  String performanceTotal,
  String religionTotal,
  String societyTotal,
  String stealthTotal,
  String survivalTotal,
  String thieveryTotal,
  String acrobaticsModifier,
  String arcanaModifier,
  String athleticsModifier,
  String craftingModifier,
  String deceptionModifier,
  String diplomacyModifier,
  String intimidationModifier,
  String lore1Modifier,
  String lore2Modifier,
  String medicineModifier,
  String natureModifier,
  String occultismModifier,
  String performanceModifier,
  String religionModifier,
  String societyModifier,
  String stealthModifier,
  String survivalModifier,
  String thieveryModifier,
  String acrobaticsProfNum,
  String arcanaProfNum,
  String athleticsProfNum,
  String craftingProfNum,
  String deceptionProfNum,
  String diplomacyProfNum,
  String intimidationProfNum,
  String lore1ProfNum,
  String lore2ProfNum,
  String medicineProfNum,
  String natureProfNum,
  String occultismProfNum,
  String performanceProfNum,
  String religionProfNum,
  String societyProfNum,
  String stealthProfNum,
  String survivalProfNum,
  String thieveryProfNum,
  int acrobaticsProf,
  int arcanaProf,
  int athleticsProf,
  int craftingProf,
  int deceptionProf,
  int diplomacyProf,
  int intimidationProf,
  int lore1Prof,
  int lore2Prof,
  int medicineProf,
  int natureProf,
  int occultismProf,
  int performanceProf,
  int religionProf,
  int societyProf,
  int stealthProf,
  int survivalProf,
  int thieveryProf,
  String languages,
}) {
  return Padding(
      padding: EdgeInsets.only(left: 5.0),
      child: Column(children: <Widget>[
        buildLabeledBox(
            width: 290.0,
            height: 380.0,
            backgroundColor: PdfColors.grey,
            label: 'Skills',
            child: Column(children: <Widget>[
              buildSkillRow(skillTotal:acrobaticsTotal ?? '', numProf:acrobaticsProfNum ?? '', prof:acrobaticsProf ?? 0, nameSkill: 'acrobatics',ability: 'DEX',armor: '  ',),
              buildSkillRow(skillTotal:arcanaTotal ?? '', numProf:arcanaProfNum ?? '', prof:arcanaProf ?? 0, nameSkill: 'arcana',ability: 'INT',),
              buildSkillRow(skillTotal:athleticsTotal ?? '', numProf:athleticsProfNum ?? '', prof:athleticsProf ?? 0, nameSkill: 'athletics', ability: 'STR', armor: '  '),
              buildSkillRow(skillTotal:craftingTotal ?? '', numProf:craftingProfNum ?? '', prof:craftingProf ?? 0, nameSkill: 'crafting',ability: 'INT',),
              buildSkillRow(skillTotal:deceptionTotal ?? '', numProf:deceptionProfNum ?? '', prof:deceptionProf ?? 0, nameSkill: 'deception',ability: 'CHA',),
              buildSkillRow(skillTotal:diplomacyTotal ?? '', numProf:diplomacyProfNum ?? '', prof:diplomacyProf ?? 0, nameSkill: 'diplomacy',ability: 'CHA',),
              buildSkillRow(skillTotal:intimidationTotal ?? '', numProf:intimidationProfNum ?? '', prof:intimidationProf ?? 0, nameSkill: 'intimidation',ability: 'CHA',),
              buildSkillRow(skillTotal:lore1Total ?? '', numProf:lore1ProfNum ?? '', prof:lore1Prof ?? 0, nameSkill: 'lore1',ability: 'INT',),
              buildSkillRow(skillTotal:lore2Total ?? '', numProf:lore2ProfNum ?? '', prof:lore2Prof ?? 0, nameSkill: 'lore2',ability: 'INT',),
              buildSkillRow(skillTotal:medicineTotal ?? '', numProf:medicineProfNum ?? '', prof:medicineProf ?? 0, nameSkill: 'medicine',ability: 'WIS',),
              buildSkillRow(skillTotal:natureTotal ?? '', numProf:natureProfNum ?? '', prof:natureProf ?? 0, nameSkill: 'nature',ability: 'WIS',),
              buildSkillRow(skillTotal:occultismTotal ?? '', numProf:occultismProfNum ?? '', prof:occultismProf ?? 0, nameSkill: 'occultism',ability: 'INT',),
              buildSkillRow(skillTotal:performanceTotal ?? '', numProf:performanceProfNum ?? '', prof:performanceProf ?? 0, nameSkill: 'performance',ability: 'CHA',),
              buildSkillRow(skillTotal:religionTotal ?? '', numProf:religionProfNum ?? '', prof:religionProf ?? 0, nameSkill: 'religion',ability: 'WIS',),
              buildSkillRow(skillTotal:societyTotal ?? '', numProf:societyProfNum ?? '', prof:societyProf ?? 0, nameSkill: 'society',ability: 'INT',),
              buildSkillRow(skillTotal:stealthTotal ?? '', numProf:stealthProfNum ?? '', prof:stealthProf ?? 0, nameSkill: 'stealth', ability: 'DEX', armor: '  '),
              buildSkillRow(skillTotal:survivalTotal ?? '', numProf:survivalProfNum ?? '', prof:survivalProf ?? 0, nameSkill: 'survival',ability: 'WIS',),
              buildSkillRow(skillTotal:thieveryTotal ?? '', numProf:thieveryProfNum ?? '', prof:thieveryProf ?? 0, nameSkill: 'thievery', ability: 'DEX', armor: '  '),
            ])),
        buildLabeledBox(
            label: 'Languages',
            width: 290.0,
            height: 37.0,
            backgroundColor: PdfColors.white,
            border: BoxBorder(
                top: true,
                right: true,
                left: true,
                bottom: true,
                width: 1.0,
                color: PdfColors.black),
            child: buildNumberBox(number: languages ?? '')),
      ]));
}

Widget buildSkillRow({
  String nameSkill,
  String skillTotal,
  String ability,
  String modifier,
  String numProf,
  int prof,
  String item,
  String armor,
}) {
  return Padding(
      padding: EdgeInsets.only(top: 2.0),
      child: Row(children: <Widget>[
        Container(
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: Text(nameSkill.toUpperCase(),
                          style: TextStyle(
                              color: PdfColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0))),
                ])),
        Container(
            width: 190.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    buildNumberBox(number: skillTotal ?? ''),
                    Container(
                        height: 18.0,
                        width: 6.0,
                        padding: EdgeInsets.symmetric(horizontal: 1.0),
                        child: Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('=',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8.0,
                                        color: PdfColors.white))))),
                    buildLabeledNumberBox(
                        label: ability.toUpperCase(), number: modifier ?? ''),
                    buildLabeledNumberBox(label: 'PROF', number: numProf ?? ''),
                    buildProficiencyRow(prof: prof),
                    buildLabeledNumberBox(label: 'item', number: item ?? ''),
                    (armor != null)
                        ? buildLabeledNumberBox(
                            label: 'Armor', number: ('-' + armor))
                        : Container(),
                  ])
                ])),
      ]));
}

Widget buildFeatureRow({
  String nameFeature,
  String indexFeature
}) {
  return Padding(
    padding: EdgeInsets.only(top: 2.0),
    child: buildWidgetBox(
      height: 14.0,
      width: 280.0,
      contents: Row(children: <Widget>[
        Container(
            height: double.infinity,
            width: 210.0,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
                child: Text(nameFeature ?? '',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black)))),
        Container(
            height: double.infinity,
            width: 70.0,
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.0),
                child: Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right:3.0), 
                      child: Text(indexFeature ?? '',
                    
                    style: TextStyle(
                        fontSize: 8.0,
                        fontWeight: FontWeight.bold,
                        color: PdfColors.black)))))))
      ])));
}
