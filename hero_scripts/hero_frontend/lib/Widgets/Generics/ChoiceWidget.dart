import 'package:flutter/material.dart';

class Choice_Widget extends StatelessWidget {
  final BoxDecoration decoration;
  final Function blocFunction;
  final item;
  final Color color;
  Choice_Widget({this.color, this.blocFunction, this.decoration, this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      child: ListTile(
        onTap: () {
          blocFunction;
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(
          "${item.name}",
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            Expanded(
                child:
                    Text("${item.description}", style: TextStyle(color: color)))
          ],
        ),
      ),
    );
  }
}
