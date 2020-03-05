import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Character Creation"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () => debugPrint("Icon Tapped!"),
          ),
          new IconButton(
            icon: new Icon(Icons.sort),
            onPressed: () => null,
          ),
        ],
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                  child: ListTile(
                      onTap: () => Navigator.pushNamed(context, '/Ancestries'),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "Ancestries",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.description, color: Colors.orangeAccent),
                          Expanded(
                              child: Text("Finish Feat Selection",
                                  style: TextStyle(color: Colors.white)))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: Colors.white, size: 30.0)),
                )),
            Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                  child: ListTile(
                      onTap: () => Navigator.pushNamed(context, '/Classes'),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "Classes",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.description, color: Colors.orangeAccent),
                          Expanded(
                              child: Text("Showing list of Classes",
                                  style: TextStyle(color: Colors.white)))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: Colors.white, size: 30.0)),
                )),
            Card(
                elevation: 8.0,
                margin:
                    new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                  child: ListTile(
                      onTap: () => Navigator.pushNamed(context, '/Feats'),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        "Feats",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(Icons.description, color: Colors.orangeAccent),
                          Expanded(
                              child: Text("All done",
                                  style: TextStyle(color: Colors.white)))
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: Colors.white, size: 30.0)),
                )),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          final bloc = Character_Provider.of(context);
          bloc.wipeCurrentData();
          Navigator.pushNamed(context, '/Characters');
        },
        backgroundColor: Colors.brown,

        tooltip: 'Going up',
        child: new Icon(Icons.add, color: Theme.of(context).textTheme.display1.color,),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.account_box), title: new Text("Characters")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.print), title: new Text("PDFs")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.cloud), title: new Text("Upload")),
        ],
        onTap: (int i) => debugPrint("Hey Touched $i"),
      ),
    );
  }
}
