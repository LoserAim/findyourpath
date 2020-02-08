import 'package:card_settings/widgets/card_settings_panel.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';

class Ancestry_Detail_Widget extends StatelessWidget {
  final int itemId;

  Ancestry_Detail_Widget({this.itemId});
  @override
  Widget build(BuildContext context) {
    final bloc = Ancestry_Detail_Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: CardSettings(
        children: <Widget>[
          CardSettingsHeader()
        ],
      ),
    );
  }
}