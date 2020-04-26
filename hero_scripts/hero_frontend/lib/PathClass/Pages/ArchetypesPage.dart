import 'package:card_settings/widgets/card_settings_field.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/PathClass/Models/PathClass.dart';
import 'package:hero_frontend/PathClass/Providers/ClassProvider.dart';
import 'package:hero_frontend/PathClass/Widgets/ArchetypesCardWidget.dart';


class ClassArchetypesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = ClassProvider.of(context);
    return CardSettings(
      children: <Widget>[

        CardSettingsField(
          label: "Available Archetypes",
          contentOnNewLine: true,
          content: StreamBuilder(
            stream: bloc.pathClass,
            builder:
                (BuildContext context, AsyncSnapshot<PathClass> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();

              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data.archetypes.length,
                  itemBuilder: (context, i) {
                    return ArchetypesCardWidget(
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
