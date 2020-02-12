import 'package:card_settings/card_settings.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/FeatListProvider.dart';
import 'package:hero_frontend/Models/FeatModel.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';
import 'package:hero_frontend/Widgets/Generics/GenericCardWidget.dart';
import 'package:hero_frontend/Widgets/Generics/LoadingContainerWidget.dart';

class Feat_Card_Widget extends StatelessWidget {
  final int itemId;

  Feat_Card_Widget({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = Feat_List_Provider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<Feat>>> snapshot) {
        if (!snapshot.hasData) return Loading_Container_Widget();
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (BuildContext context, AsyncSnapshot<Feat> itemSnapshot) {
            if (!itemSnapshot.hasData) return Loading_Container_Widget();

            return Generic_Card_Widget(
              item: itemSnapshot.data);
            
          },
        );
      },
    );
  }
}
