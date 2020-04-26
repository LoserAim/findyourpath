import 'package:flutter/material.dart';
import 'package:hero_frontend/Feat/Models/Feat.dart';
import 'package:hero_frontend/Feat/Providers/FeatProvider.dart';
import 'package:hero_frontend/Widgets/LoadingContainerWidget.dart';

class FeatCardWidget extends StatelessWidget {
  final int itemId;
  FeatCardWidget({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = FeatProvider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<Feat>>> snapshot) {
        if (!snapshot.hasData) return LoadingContainerWidget();
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (BuildContext context, AsyncSnapshot<Feat> itemSnapshot) {
            if (!itemSnapshot.hasData) return LoadingContainerWidget();

            return Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: StreamBuilder(
                  stream: bloc.chosenFeats,
                  builder:
                      (context, AsyncSnapshot<List<Feat>> chosenFeatSnapshot) {
                    BoxDecoration decoration = BoxDecoration();
                    Color color = Colors.orangeAccent;
                    if (!chosenFeatSnapshot.hasData) {
                      color = Theme.of(context).textTheme.display2.color;
                      decoration = BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 1.0),
                      );
                    } else if (chosenFeatSnapshot.data
                        .contains(itemSnapshot.data)) {
                      decoration =
                          BoxDecoration(color: Theme.of(context).primaryColor);
                      color = Theme.of(context).textTheme.display1.color;
                    } else {
                      color = Theme.of(context).textTheme.display2.color;
                      decoration = BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 1.0),
                      );
                    }

                    return Container(
                      decoration: decoration,
                      child: ListTile(
                        onTap: () {
                          chosenFeatSnapshot.data.contains(itemSnapshot.data)
                              ? chosenFeatSnapshot.data
                                  .remove(itemSnapshot.data)
                              : chosenFeatSnapshot.data.add(itemSnapshot.data);
                          bloc.changeChosenFeats(chosenFeatSnapshot.data);
                        },
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        title: Text(
                          "${itemSnapshot.data.level} ${itemSnapshot.data.name}",
                          style: TextStyle(
                              color: color, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Expanded(
                                child: Text("${itemSnapshot.data.description}",
                                    style: TextStyle(color: color)))
                          ],
                        ),
                      ),
                    );
                  }),
            );
          },
        );
      },
    );
  }
}
