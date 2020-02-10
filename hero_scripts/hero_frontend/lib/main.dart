import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryListProvider.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestrySelectorPage.dart';
import 'package:hero_frontend/Pages/Navigation/HomePage.dart';
import 'package:hero_frontend/Widgets/Ancestry/AncestryDetailWidget.dart';
//import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';

void main() {
  runApp(Ancestry_List_Provider(
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
        case "Ancestries":
          return MaterialPageRoute(builder: (context) {
            final bloc = Ancestry_List_Provider.of(context);
            bloc.fetchTopIds();
            return AncestrySelectorPage();
          });
        default:
          return MaterialPageRoute(builder: (context) {
            return Home_Page();
          });
      }
  }
  // if (settings.name.contains("/id="))
  // {
  //   return MaterialPageRoute(builder: (context) {
  //       final int itemId = int.parse(settings.name.replaceFirst('/id=', ''));
  //       final bloc = Ancestry_Detail_Provider.of(context);
  //       bloc.fetchData(itemId);
  //       return Ancestry_Detail_Widget(itemId: itemId,);
  //     });
  // }
  // switch (settings.name) {
  //   case "/Ancestries":
  //     return MaterialPageRoute(builder: (context) {
  //       final bloc = Ancestry_List_Provider.of(context);
  //       bloc.fetchTopIds();
  //       return AncestrySelectorPage();
  //     });

  // }
}
