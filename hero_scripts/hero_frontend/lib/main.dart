import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryListProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryDetailPage.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryHeritagePage.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestrySelectorPage.dart';
import 'package:hero_frontend/Pages/Classes/ClassSelectorPage.dart';
import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';
import 'package:hero_frontend/Pages/Navigation/HomePage.dart';
import 'package:hero_frontend/Widgets/Ancestry/AncestryDetailWidget.dart';
import 'package:hero_frontend/Widgets/Class/ClassDetailWidget.dart';

import 'BusinessLogic/Providers/FeatListProvider.dart';
//import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';

void main() {
  runApp(Class_Provider(
      child: Feat_List_Provider(
      child: Ancestry_List_Provider(
        child: Ancestry_Detail_Provider(
          child: new MaterialApp(
            title: "Select your crapp",
            onGenerateRoute: routes,
            theme: new ThemeData(
              primaryColor: Colors.red,
              accentColor: Colors.redAccent,
              cardColor: Colors.white,
              backgroundColor: Colors.orange[100],
              buttonColor: Colors.orange,
            ),
          ),
        ),
      ),
    ),
  ));
}

Route routes(RouteSettings settings) {
  final List<String> path = settings.name.split("/");
  print(path);
  switch (path.length) {
    case 0:
      return MaterialPageRoute(builder: (context) {
        return Home_Page();
      });
    case 1:
      return MaterialPageRoute(builder: (context) {
        return Home_Page();
      });
    case 2:
      switch (path[1]) {
        case "Ancestries":
          return MaterialPageRoute(builder: (context) {
            final bloc = Ancestry_List_Provider.of(context);
            bloc.fetchTopIds();
            return AncestrySelectorPage();
          });
        case "Classes":
          return MaterialPageRoute(builder: (context) {
            final bloc = Class_Provider.of(context);
            bloc.fetchTopIds();
            return Class_Selector_Page();
          });
        case "Feats":
          return MaterialPageRoute(builder: (context) {
            final bloc = Feat_List_Provider.of(context);
            bloc.fetchTopIds();
            return Feat_Selector_Page();
          });
        default:
          return MaterialPageRoute(builder: (context) {
            return Home_Page();
          });
      }
      break;
    case 3:
      switch (path[1]) {
        case "Ancestries":
          return MaterialPageRoute(builder: (context) {
            final int itemId = int.parse(path[2]);
            final bloc = Ancestry_Detail_Provider.of(context);
            bloc.fetchData(itemId);
            return Ancestry_Detail_Page(
              itemId: itemId,
            );
          });
        case "Classes":
          return MaterialPageRoute(builder: (context) {
            final int itemId = int.parse(path[2]);
            final bloc = Class_Provider.of(context);
            bloc.fetchData(itemId);
            return Class_Detail_Widget();
          });
        default:
          return MaterialPageRoute(builder: (context) {
            return Home_Page();
          });
      }
      break;
    case 4:
      switch (path[1]) {
        case "Ancestries":
          switch (path[3])
          {
            case "Heritages":
              return MaterialPageRoute(builder: (context) {
                return Ancestry_Heritage_Page();
              });
          }
          break;
        default:
          return MaterialPageRoute(builder: (context) {
            return Home_Page();
          });
      }
      break;
  }
 
}
