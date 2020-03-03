import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/Models/PathClassModel.dart';
import 'package:hero_frontend/Widgets/Generics/LoadingContainerWidget.dart';

class Class_Card_Widget extends StatelessWidget {
  final int itemId;

  Class_Card_Widget({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = Class_Provider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<Path_Class>>> snapshot) {
        if (!snapshot.hasData) return Loading_Container_Widget();
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder:
              (BuildContext context, AsyncSnapshot<Path_Class> itemSnapshot) {
            if (!itemSnapshot.hasData) return Loading_Container_Widget();

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
