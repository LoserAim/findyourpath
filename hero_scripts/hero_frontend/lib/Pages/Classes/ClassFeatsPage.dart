import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/FeatListProvider.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/Settings/TextFormat.dart';
import 'package:hero_frontend/Widgets/Feats/FeatCardWidget.dart';
import 'package:hero_frontend/Widgets/Generics/GenericInfoCardWidget.dart';

class Class_Feats_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final classbloc = Class_Provider.of(context);
    return StreamBuilder(
      stream: classbloc.pathClass,
      builder: (BuildContext context, AsyncSnapshot<Path_Class> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data.class_feats.length,
          itemBuilder: (BuildContext context, int index) {
            if (snapshot.data.class_feats[index].level == 1)
              return Generic_Info_Card_Widget(
                item: snapshot.data.class_feats[index],
                stream: classbloc.chosenFeats,
                addToStream: classbloc.changeChosenFeats,
              );
          },
        );
      },
    );
  }
}
