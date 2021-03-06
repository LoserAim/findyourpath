import 'package:card_settings/card_settings.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/PathClass/Models/PathClass.dart';
import 'package:hero_frontend/PathClass/Providers/ClassProvider.dart';
import 'package:hero_frontend/Widgets/LoadingContainerWidget.dart';



class ClassDetailPage extends StatelessWidget {
  final Map<String, String> _abilities = {
    "STR": "Strength",
    "DEX": "Dexterity",
    "CON": "Constitution",
    "INT": "Intelligence",
    "WIS": "Wisdom",
    "CHA": "Charisma"
  };
  final Map<String, String> _proficiency_type = {
    'CDC': 'Class Dice Check',
    'ARC': 'Armor',
    'PER': 'Perception',
    'SAT': 'Saving Throws',
    'SKS': 'Strike',
    'SKI': 'Skill',
    'WEA': 'Weapon',
    'SDC': 'Spell Dice Check',
  };
  final Map<String, String> _proficiency_rank = {
    'T': 'Trained',
    'E': 'Expert',
    'M': 'Master',
    'L': 'Legendary',
  };

  @override
  Widget build(BuildContext context) {
    final bloc = ClassProvider.of(context);
    return StreamBuilder(
        stream: bloc.pathClass,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LoadingContainerWidget();
          return CardSettings.sectioned(
            labelWidth: 160.0,
            labelAlign: TextAlign.left,
            contentAlign: TextAlign.right,
            children: <CardSettingsSection>[
              CardSettingsSection(children: <Widget>[
                CardSettingsHeader(label: "Class Info"),
                CardSettingsField(
                  label: "Hit Points",
                  icon: Icon(Icons.favorite),
                  content: Text(snapshot.data.hit_points.toString()),
                ),
                CardSettingsField(
                  label: "Additional Skills",
                  icon: Icon(Icons.import_contacts),
                  content: Text(snapshot.data.additional_skills.toString()),
                ),
                CardSettingsField(
                  label: "Key Ability",
                  icon: Icon(Icons.explore),
                  content: Container(
                    child:
                        Text(_abilities[snapshot.data.key_ability.toString()]),
                  ),
                ),
              ]),
              CardSettingsSection(children: <Widget>[
                CardSettingsHeader(label: "Initial Proficiencies"),
                StreamBuilder(
                  stream: bloc.pathClass,
                  builder: (BuildContext context,
                      AsyncSnapshot<PathClass> snapshot) {
                    if (snapshot.hasData && snapshot.data.proficiencies.length > 0) {
                      List<Widget> profs = List();
                      List<List<Proficiency>> test = List();
                      List<Proficiency> items = snapshot.data.proficiencies;
                      items.sort((a, b) =>
                          a.proficiency_type.compareTo(b.proficiency_type));
                      _proficiency_type.forEach((k, v) {
                        test.add(items
                            .where((p) => p.proficiency_type == k)
                            .toList());
                      });
                      if (test.any((item) => item.length != 0))
                        test.forEach((itemList) {
                          if (itemList.length != 0) {
                            List<String> temps = List();

                            itemList.forEach((p) {
                              temps.add(
                                  "${_proficiency_rank[p.rank]} in ${p.name}");
                            });
                            profs.add(CardSettingsField(
                                label: _proficiency_type[
                                    itemList[0].proficiency_type],
                                contentOnNewLine: false,
                                content: Text(temps.join("\n"))));
                          }
                        });
                      return Wrap(
                        children: profs,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                      
                  },
                ),
              ]),
            ],
          );
        });
  }
}
