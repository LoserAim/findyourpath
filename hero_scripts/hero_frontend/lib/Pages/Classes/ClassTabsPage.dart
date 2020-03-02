import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/Pages/Classes/ClassArchetypesPage.dart';
import 'package:hero_frontend/Pages/Classes/ClassFeatsPage.dart';
import 'package:hero_frontend/Pages/Classes/ClassFeaturePage.dart';
import 'package:hero_frontend/Pages/Classes/ClassSelectorPage.dart';
import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';
import 'package:hero_frontend/Widgets/Class/ClassDetailWidget.dart';

class Class_Tabs_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Class_Provider.of(context);
    return StreamBuilder(
      stream: bloc.pathClass,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
        return DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.assignment_ind)),
                    Tab(icon: Icon(Icons.assignment)),
                    Tab(icon: Icon(Icons.dns)),
                    Tab(icon: Icon(Icons.book)),
                  ],
                ),
                title: Text(snapshot.data.name),
              ),
              body: TabBarView(
                children: [
                  Class_Detail_Widget(),
                  Class_Archetypes_Page(),
                  Class_Feature_Page(),
                  Class_Feats_Page(),
                ],
              ),
            ));
      },
    );
  }
}
