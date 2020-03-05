import 'package:flutter/material.dart';

class NameDetail_Widget extends StatelessWidget {
  final String name;
  final String description;
  final String routepath;
  final Icon icon;
  final double progress;

  const NameDetail_Widget({this.name, this.description, this.routepath, this.icon, this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: ListTile(
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.white24))),
                child: (icon != null) ? icon : Icon(Icons.autorenew, color: Colors.white),
              ),
              onTap: () => (routepath != null ) ? Navigator.pushNamed(context, routepath) : null,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(
                (name != null) ? name : "No name passed in!",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: <Widget>[
                  Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: (progress != null) ? progress : 0.0,
                        valueColor: AlwaysStoppedAnimation(Theme.of(context).iconTheme.color)),
                  )),
                  Expanded(
                    flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only( left: 10.0),
                        child: Text((description != null) ? description : "No description passed in!",
                            style: TextStyle(color: Colors.white)),
                      ))
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0)),
        ));
  }
}
