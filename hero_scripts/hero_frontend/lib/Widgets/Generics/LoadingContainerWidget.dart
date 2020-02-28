import 'package:flutter/material.dart';

class Loading_Container_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          child: Column(
            children: <Widget>[
              buildContainer(),
              buildContainer(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildContainer() {
    return Container(
        color: Colors.grey[200],
        height: 128,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 5.0,
          bottom: 5.0,
        ));
  }
}
