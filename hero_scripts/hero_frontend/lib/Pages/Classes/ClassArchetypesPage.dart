import 'package:card_settings/widgets/card_settings_field.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';
import 'package:hero_frontend/Widgets/Class/ArchetypesCardWidget.dart';

class Class_Archetypes_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Class_Provider.of(context);
    return CardSettings(
        children: <Widget>[
          CardSettingsField(
            label: "Available Archetypes",
            contentOnNewLine: true,
            content: StreamBuilder(
              stream: bloc.archetypes,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Archetype>> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                List<Widget> choices = List();

                snapshot.data.forEach((item) {
                  choices.add(
                    Archetypes_Card_Widget(
                      item: item,
                    ),
                  );
                });

                return Wrap(
                  children: choices,
                );
              },
            ),
          ),
        ],
      );
    
  }
}