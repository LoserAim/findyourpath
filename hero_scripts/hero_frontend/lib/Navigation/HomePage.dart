import 'package:flutter/material.dart';
import 'package:hero_frontend/Character/Providers/CharacterProvider.dart';
import 'package:hero_frontend/Character/Widgets/CardWidget.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int httpRequest = 0;
    final bloc = CharacterProvider.of(context);
           // bloc.fetchTopIds();
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
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          StreamBuilder(
            stream: bloc.topIds,
            builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
              if (!snapshot.hasData && httpRequest < 10){
                bloc.fetchTopIds();
                return Center(child: CircularProgressIndicator());}

              return ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  bloc.fetchItem(snapshot.data[index]);
                  return CharacterCardWidget(itemId: snapshot.data[index],);
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          final bloc = CharacterProvider.of(context);
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
