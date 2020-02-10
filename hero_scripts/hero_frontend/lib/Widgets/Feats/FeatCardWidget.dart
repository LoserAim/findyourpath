import 'package:flutter/material.dart';

class Feat_Card_Widget extends StatelessWidget {
  final int itemId;

  Feat_Card_Widget({this.itemId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream ,
      initialData: initialData ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          child: child,
        );
      },
    ),
  }
}