import 'package:flutter/material.dart';

class GenericCardWidget extends StatelessWidget {
  final item;
  GenericCardWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Card(elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ChoiceChip(
        shape: RoundedRectangleBorder(),
        backgroundColor: Colors.redAccent,
        label: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(
          "${item.level.toString()} ${item.name}",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.description, color: Colors.orangeAccent),
            Expanded(child: Text("${item.description}", style: TextStyle(color: Colors.white)))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)), 
        selected: null,
        ));
  }
}