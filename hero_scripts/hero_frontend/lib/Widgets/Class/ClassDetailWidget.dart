import 'package:card_settings/card_settings.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/Widgets/Generics/LoadingContainerWidget.dart';

class Class_Detail_Widget extends StatelessWidget {
  final Map<String, String> _abilities = {
    "STR": "Strength",
    "DEX": "Dexterity",
    "CON": "Constitution",
    "INT": "Intelligence",
    "WIS": "Wisdom",
    "CHA": "Charisma"
  };

  @override
  Widget build(BuildContext context) {
    final bloc = Class_Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: bloc.pathClass,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return Text("loading...");
            return Container(
              child: Text(snapshot.data.name.toString()),
            );
          },
        ),
      ),
      body: StreamBuilder(
          stream: bloc.pathClass,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Loading_Container_Widget();
            return CardSettings.sectioned(
              labelWidth: 170.0,
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
                      child: Text(
                          _abilities[snapshot.data.key_ability.toString()]),
                    ),

                  ),
                  CardSettingsButton(
                    label: "Pick your Archetype",
                    onPressed: () => Navigator.pushNamed(context, '/Classes/${snapshot.data.id.toString()}/Archetypes'),
                  ),
                  
                ]),
              ],
            );
          }),
    );
  }
}
