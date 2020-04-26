import 'package:flutter/material.dart';
import 'package:hero_frontend/PathClass/Models/PathClass.dart';
import 'package:hero_frontend/PathClass/Providers/ClassProvider.dart';
import 'package:hero_frontend/Widgets/GenericInfoCardWidget.dart';

class ClassFeatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final classbloc = ClassProvider.of(context);
    return StreamBuilder(
      stream: classbloc.pathClass,
      builder: (BuildContext context, AsyncSnapshot<PathClass> snapshot) {
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
              return GenericInfoCardWidget(
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
