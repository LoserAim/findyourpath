import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryListProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/CharacterProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/ClassProvider.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryDetailPage.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryHeritagePage.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestrySelectorPage.dart';
import 'package:hero_frontend/Pages/Character/CharacterCreatorPage.dart';
import 'package:hero_frontend/Pages/Character/CharacterDetailPage.dart';
import 'package:hero_frontend/Pages/Classes/ClassSelectorPage.dart';
import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';
import 'package:hero_frontend/Pages/Navigation/HomePage.dart';

import 'BusinessLogic/Providers/FeatListProvider.dart';
import 'Pages/Classes/ClassTabsPage.dart';
//import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';

void main() {
  runApp(Character_Provider(
    child: Class_Provider(
      child: Feat_List_Provider(
        child: Ancestry_List_Provider(
          child: Ancestry_Detail_Provider(
            child: new MaterialApp(
              title: "Select your crapp",
              onGenerateRoute: routes,
              theme: new ThemeData(
                  iconTheme: IconThemeData(
                    color: Colors.orangeAccent,
                  ),
                  primaryColor: Colors.brown,
                  accentColor: Colors.brown,
                  cardColor: Colors.white,
                  textSelectionColor: Colors.black,
                  backgroundColor: Colors.brown[50],
                  buttonColor: Colors.orange,
                  textTheme: TextTheme(
                    display1: TextStyle(color: Colors.white),
                    display2: TextStyle(color: Colors.black),
                    display3: TextStyle(color: Colors.red),
                  )),
            ),
          ),
        ),
      ),
    ),
  ));
}

Route routes(RouteSettings settings) {
  final List<String> path = settings.name.split("/");
  
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
        case "Characters":
          return MaterialPageRoute(
              settings: RouteSettings(name: '/Characters'),
              builder: (context) {
                return Character_Creator_Page();
              });
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
            return Ancestry_Detail_Page();
          });
        case "Classes":
          return MaterialPageRoute(builder: (context) {
            final int itemId = int.parse(path[2]);
            final classbloc = Class_Provider.of(context);
            final featbloc = Feat_List_Provider.of(context);
            classbloc.fetchData(itemId);
            featbloc.fetchClassFeatIds(itemId);
            return Class_Tabs_Page();
          });
        case "Characters":
          switch(path[2]) {
            case 'Info':
              return MaterialPageRoute(builder: (context) {
              return Character_Detail_Page();
          });
          }
          break;
        default:
          return MaterialPageRoute(builder: (context) {
            return Home_Page();
          });
      }
      break;
    case 4:
      switch (path[1]) {
        case "Ancestries":
          switch (path[3]) {
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
    default:
      return MaterialPageRoute(builder: (context) {
        return Home_Page();
      });
  }
}
