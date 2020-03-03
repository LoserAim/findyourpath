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
              stream: bloc.archetypesIds,
              builder: (BuildContext context,
                  AsyncSnapshot<List<int>> snapshot) {
                if (!snapshot.hasData){
                  bloc.reloadArchetypesIds(bloc.returnPathClass.archetypes);
                  return CircularProgressIndicator();
                } 
                List<Widget> choices = List();

                snapshot.data.forEach((id) {
                  bloc.fetchArchetype(id);
                  choices.add(
                    
                    Archetypes_Card_Widget(
                      id: id,
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