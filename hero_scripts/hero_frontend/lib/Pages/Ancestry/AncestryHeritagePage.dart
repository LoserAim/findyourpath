import 'package:card_settings/card_settings.dart';
import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/Models/AncestryModel.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';
import 'package:hero_frontend/Widgets/Ancestry/HeritageCardWidget.dart';

class Ancestry_Heritage_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Ancestry_Detail_Provider.of(context);
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
                    Heritage_Card_Widget(
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
