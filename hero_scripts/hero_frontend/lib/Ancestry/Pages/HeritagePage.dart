import 'package:card_settings/card_settings.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/Ancestry/Models/Heritage.dart';
import 'package:hero_frontend/Ancestry/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/Ancestry/Widgets/HeritageCardWidget.dart';


class AncestryHeritagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = AncestryDetailProvider.of(context);
    return CardSettings(
        children: <Widget>[
          CardSettingsField(
            label: "Available Heritages",
            contentOnNewLine: true,
            content: StreamBuilder(
              stream: bloc.heritages,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Heritage>> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                List<Widget> choices = List();
                List<Heritage> current = snapshot.data;

                snapshot.data.forEach((item) {
                  choices.add(
                    HeritageCardWidget(
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
