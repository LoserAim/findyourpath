import 'package:filex/filex.dart';
import 'package:flutter/material.dart';
import 'package:hero_frontend/Character/Models/Character.dart';
import 'package:hero_frontend/Character/Providers/CharacterProvider.dart';
import 'package:hero_frontend/Widgets/LoadingContainerWidget.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CharacterCardWidget extends StatelessWidget {
  final int itemId;

  CharacterCardWidget({this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = CharacterProvider.of(context);
    return StreamBuilder(
      stream: bloc.items,
      builder: (BuildContext context,
          AsyncSnapshot<Map<int, Future<Character>>> snapshot) {
        if (!snapshot.hasData) return LoadingContainerWidget();
        return FutureBuilder(
          future: snapshot.data[itemId],
          builder:
              (BuildContext context, AsyncSnapshot<Character> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainerWidget();
            }

            return Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                    decoration:
                        BoxDecoration(color: Theme.of(context).primaryColor),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "${itemSnapshot.data.name}",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.display1.color,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${itemSnapshot.data.pathClass.name}",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.display1.color,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.file_download,
                            color: Theme.of(context).cardColor, size: 30.0),
                        onPressed: () async {
                          Directory externalDirectory =
                              new Directory(await _localPath);
                          final controller =
                              FilexController(path: externalDirectory.path);
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 250.0,
                                  child: AlertDialog(
                                    title: Text("Downloading PDF"),
                                    content: FutureBuilder(
                                      future: itemSnapshot.data.generatePDF(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.connectionState !=
                                            ConnectionState.done) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text("Preparing File for download"),
                                              CircularProgressIndicator(
                                                  backgroundColor: Colors.blue),
                                            ],
                                          );
                                        }

                                        return FutureBuilder(
                                          future: writePdf(snapshot.data,
                                              itemSnapshot.data.name),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Text("Downloading File"),
                                                  CircularProgressIndicator(
                                                      backgroundColor:
                                                          Colors.blue),
                                                ],
                                              );
                                            }
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                
                                                Text(
                                                    "File Download is Complete!"),
                                                Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green,
                                                  size: 50.0,
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    )));
          },
        );
      },
    );
  }

  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();

    return directory.path;
  }

  Future<File> _localFile(String name) async {
    final path = await _localPath;
    return File('$path/${name.splitMapJoin(' ')}.pdf');
  }

  writePdf(List<int> pdf, String name) async {
    final File file = await _localFile(name);
    // Write the file.
    file.writeAsBytesSync(pdf);
  }
}


