import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/Models/AncestryModel.dart';

class Heritage_Card_Widget extends StatelessWidget {
  final item;
  Heritage_Card_Widget({this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = Ancestry_Detail_Provider.of(context);
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: StreamBuilder(
            stream: bloc.chosenHeritages,
            builder: (context, AsyncSnapshot<List<Heritage>> snapshot) {
              if (!snapshot.hasData)
                return Text("Loading...");
              if (snapshot.data.contains(item))
                return Container(
                  decoration: BoxDecoration(color:Colors.redAccent),
                  child: ListTile(
                      onTap: () {
                        List<Heritage> temp = [item];
                        bloc.changeChosenHeritages(temp);
                      },
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "${item.name}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          
                          Expanded(
                              child: Text("${item.description}",
                                  style: TextStyle(color: Colors.black)))
                        ],
                      ),
                      ),
                );
              else {
                return Container(
                  decoration: BoxDecoration(border: Border.all(color:Colors.redAccent, width: 1.0 ),),
                  child: ListTile(
                      onTap: () {
                        if (!snapshot.data.contains(item))
                        {
                          List<Heritage> temp = [item];
                          bloc.changeChosenHeritages(temp);
                        }
                        
                      },
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "${item.name}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          
                          Expanded(
                              child: Text("${item.description}",
                                  style: TextStyle(color: Colors.black)))
                        ],
                      ),
                  )  
                );
              }
            }));
  }
}
