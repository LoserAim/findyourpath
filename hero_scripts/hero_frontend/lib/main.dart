import 'package:flutter/material.dart';
import 'package:hero_frontend/Ancestry/Pages/DetailPage.dart';
import 'package:hero_frontend/Ancestry/Pages/HeritagePage.dart';
import 'package:hero_frontend/Ancestry/Pages/SelectorPage.dart';
import 'package:hero_frontend/Ancestry/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/Ancestry/Providers/AncestryListProvider.dart';
import 'package:hero_frontend/Character/Pages/CreatorPage.dart';
import 'package:hero_frontend/Character/Pages/DetailPage.dart';
import 'package:hero_frontend/Feat/Pages/SelectorPage.dart';
import 'package:hero_frontend/Navigation/HomePage.dart';
import 'package:hero_frontend/PathClass/Pages/SelectorPage.dart';
import 'package:hero_frontend/PathClass/Pages/TabsPage.dart';
import 'Character/Providers/CharacterProvider.dart';
import 'Feat/Providers/FeatProvider.dart';
import 'PathClass/Providers/ClassProvider.dart';


void main() {
  runApp(CharacterProvider(
    child: ClassProvider(
      child: FeatProvider(
        child: AncestryListProvider(
          child: AncestryDetailProvider(
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
        return HomePage();
      });
    case 1:
      return MaterialPageRoute(builder: (context) {
        return HomePage();
      });
    case 2:
      switch (path[1]) {
        case "Characters":
          return MaterialPageRoute(
              settings: RouteSettings(name: '/Characters'),
              builder: (context) {
                return CharacterCreatorPage();
              });
        case "Ancestries":
          return MaterialPageRoute(builder: (context) {
            final bloc = AncestryListProvider.of(context);
            bloc.fetchTopIds();
            return AncestrySelectorPage();
          });
        case "Classes":
          return MaterialPageRoute(builder: (context) {
            final bloc = ClassProvider.of(context);
            bloc.fetchTopIds();
            return ClassSelectorPage();
          });
        case "Feats":
          return MaterialPageRoute(builder: (context) {
            final bloc = FeatProvider.of(context);
            bloc.fetchTopIds();
            return FeatSelectorPage();
          });
        default:
          return MaterialPageRoute(builder: (context) {
            
            return HomePage();
          });
      }
      break;
    case 3:
      switch (path[1]) {
        case "Ancestries":
          return MaterialPageRoute(builder: (context) {
            final int itemId = int.parse(path[2]);
            final bloc = AncestryDetailProvider.of(context);
            bloc.fetchData(itemId);
            return AncestryDetailPage();
          });
        case "Classes":
          return MaterialPageRoute(builder: (context) {
            final int itemId = int.parse(path[2]);
            final classbloc = ClassProvider.of(context);
            final featbloc = FeatProvider.of(context);
            classbloc.fetchData(itemId);
            featbloc.fetchClassFeatIds(itemId);
            return ClassTabsPage();
          });
        case "Characters":
          switch(path[2]) {
            case 'Info':
              return MaterialPageRoute(builder: (context) {
              return CharacterDetailPage();
          });
          }
          break;
        default:
          return MaterialPageRoute(builder: (context) {
            return HomePage();
          });
      }
      break;
    case 4:
      switch (path[1]) {
        case "Ancestries":
          switch (path[3]) {
            case "Heritages":
              return MaterialPageRoute(builder: (context) {
                return HeritageSelectorPage();
              });
          }
          break;
        default:
          return MaterialPageRoute(builder: (context) {
            return HomePage();
          });
      }
      break;
    default:
      return MaterialPageRoute(builder: (context) {
        return HomePage();
      });
  }
}
