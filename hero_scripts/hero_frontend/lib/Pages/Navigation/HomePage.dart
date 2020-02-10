import 'package:flutter/material.dart';

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
            new InkWell(
              child: Card(child: new Text("Ancestries")),
              onTap: () => Navigator.pushNamed(context, '/Ancestries'),
            ),

          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(

        onPressed: ()=> debugPrint("Floating Button Tapped!"),
        backgroundColor: Colors.brown,
        tooltip: 'Going up',
        child: new Icon(Icons.add),
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
          new BottomNavigationBarItem(icon: new Icon(Icons.account_box), title: new Text("Characters")),
          new BottomNavigationBarItem(icon: new Icon(Icons.print), title: new Text("PDFs")),
          new BottomNavigationBarItem(icon: new Icon(Icons.cloud), title: new Text("Upload")),
        ],
        onTap: (int i) => debugPrint("Hey Touched $i"),
      ),

      
    );
  }
}