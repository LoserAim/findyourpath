import 'package:flutter/material.dart';

class Ancestry_Detail_Widget extends StatelessWidget {
  final int itemId;

  Ancestry_Detail_Widget({this.itemId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Text("Hey this is is the Ancestry $itemId")
    );
  }
}