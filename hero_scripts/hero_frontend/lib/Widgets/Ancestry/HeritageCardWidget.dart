
import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/Models/AncestryModel.dart';

class Heritage_Card_Widget extends StatelessWidget {
  final item;
  Heritage_Card_Widget({this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = Ancestry_Detail_Provider.of(context);
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: StreamBuilder(
            stream: bloc.chosenHeritage,
            builder: (context, AsyncSnapshot<Heritage> snapshot) {
              BoxDecoration decoration = BoxDecoration();
                  Color color = Colors.orangeAccent;

                  if (item == snapshot.data) {
                    decoration = BoxDecoration(color: Theme.of(context).cardColor);
                    color = Theme.of(context).accentColor;
                  } else {
                    color = Theme.of(context).textSelectionColor;
                    decoration = BoxDecoration(
                      border:
                          Border.all(color: Theme.of(context).cardColor, width: 1.0),
                    );
                  }

                  return Container(
                    margin: new EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    decoration: decoration,
                    child: ListTile(
                      onTap: () {
                        bloc.changeChosenHeritage(item);
                      },
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "${item.level} ${item.name}",
                        style: TextStyle(
                            color: color, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Expanded(
                              child: Text("${item.description}",
                                  style: TextStyle(color: color)))
                        ],
                      ),
                    ),
                  );
              }
            ));
  }
}
