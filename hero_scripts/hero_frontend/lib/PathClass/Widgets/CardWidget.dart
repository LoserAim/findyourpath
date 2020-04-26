import 'package:flutter/material.dart';
import 'package:hero_frontend/PathClass/Models/PathClass.dart';
import 'package:hero_frontend/PathClass/Providers/ClassProvider.dart';
import 'package:hero_frontend/Widgets/LoadingContainerWidget.dart';

class ClassCardWidget extends StatelessWidget {
  final int itemId;

  ClassCardWidget({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = ClassProvider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<PathClass>>> snapshot) {
        if (!snapshot.hasData) return LoadingContainerWidget();
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder:
              (BuildContext context, AsyncSnapshot<PathClass> itemSnapshot) {
            if (!itemSnapshot.hasData) return LoadingContainerWidget();

            return Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                  child: ListTile(
                      onTap: () => Navigator.pushNamed(context, '/Classes/${itemSnapshot.data.id}'),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "${itemSnapshot.data.name}",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.display1.color, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: Theme.of(context).cardColor, size: 30.0)),
                ));
          },
        );
      },
    );
  }
}
