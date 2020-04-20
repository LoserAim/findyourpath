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
            stream: bloc.pathClass,
            builder:
                (BuildContext context, AsyncSnapshot<Path_Class> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.archetypes.length,
                  itemBuilder: (context, i) {
                    return Archetypes_Card_Widget(
                      item: snapshot.data.archetypes[i],
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
