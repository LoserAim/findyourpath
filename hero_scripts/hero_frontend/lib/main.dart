

import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryDetailProvider.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryListProvider.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestrySelectorPage.dart';
import 'package:hero_frontend/Widgets/Ancestry/AncestryDetailWidget.dart';
//import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';

void main() {
  runApp(new MaterialApp(
    title: "Select your crapp",
    onGenerateRoute: routes,
    theme: new ThemeData(
      primaryColor: Colors.red,
      accentColor: Colors.redAccent,
    ),
  ));
}

Route routes(RouteSettings settings) {
  if (settings.name.contains("/id="))
  {
    return MaterialPageRoute(builder: (context) {
        final int itemId = int.parse(settings.name.replaceFirst('/id=', ''));
        return Ancestry_Detail_Provider(child: Ancestry_Detail_Widget(itemId: itemId,));
      });
  }
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) {
        final bloc = Ancestry_List_Provider.of(context);
        bloc.fetchTopIds();
        return Ancestry_List_Provider(child: AncestrySelectorPage());
      });
  }
}
