import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';
import 'package:hero_frontend/Models/CharacterModel.dart';
import 'package:hero_frontend/Widgets/Generics/LoadingContainerWidget.dart';
import 'package:path_provider/path_provider.dart';


class Character_Card_Widget extends StatelessWidget {
  final int itemId;

  Character_Card_Widget({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = Character_Provider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<Character>>> snapshot) {
        if (!snapshot.hasData) return Loading_Container_Widget();
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder:
              (BuildContext context, AsyncSnapshot<Character> itemSnapshot) {
            if (!itemSnapshot.hasData) return Loading_Container_Widget();

            return Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                  child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "${itemSnapshot.data.name}",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.display1.color, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${itemSnapshot.data.name}",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.display1.color, fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.file_download,
                          color: Theme.of(context).cardColor, size: 30.0),
                          onPressed: () {
                            writePdf(itemSnapshot.data.generatePDF(), itemSnapshot.data.name);
                          },
                          ),
                )));
          },
        );
      },
    );
  }
  Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
Future<File> _localFile(String name) async {
  final path = await _localPath;
  return File('$path/$name.pdf');
}
writePdf(List<int> pdf, String name) async {
  final File file = await _localFile(name);
  // Write the file.
  file.writeAsBytesSync(pdf);
}



}
