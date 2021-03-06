import 'package:flutter/material.dart';

class GenericInfoCardWidget extends StatelessWidget {
  final item;
  final stream;
  final addToStream;
  GenericInfoCardWidget({this.item, this.stream, this.addToStream});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: StreamBuilder(
          stream: stream,
          builder: (context, AsyncSnapshot chosenItems) {
            BoxDecoration decoration = BoxDecoration();
            Color color = Colors.orangeAccent;
            if (!chosenItems.hasData) {
              color = Theme.of(context).textTheme.display2.color;
              decoration = BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 1.0),
              );
            } else if (chosenItems.data.contains(item)) {
              decoration = BoxDecoration(color: Theme.of(context).primaryColor);
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
                  chosenItems.data.contains(item)
                      ? chosenItems.data.remove(item)
                      : chosenItems.data.add(item);
                  addToStream(chosenItems.data);
                },
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                title: Text(
                  "${item.level} ${item.name}",
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
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
          }),
    );
  }
}
