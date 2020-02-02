

import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryListProvider.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestrySelectorPage.dart';
import 'package:hero_frontend/Widgets/Ancestry/AncestryDetailWidget.dart';
//import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';

void main() {
  runApp(Ancestry_List_Provider(
    child: new MaterialApp(
      title: "Select your crapp",
      onGenerateRoute: routes,
    ),
  ));
}

Route routes(RouteSettings settings) {
  if (settings.name.contains("/id="))
  {
    return MaterialPageRoute(builder: (context) {
        final int itemId = int.parse(settings.name.replaceFirst('/id=', ''));
        return Ancestry_Detail_Widget(itemId: itemId,);
      });
  }
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) {
        final bloc = Ancestry_List_Provider.of(context);
        bloc.fetchTopIds();
        return AncestrySelectorPage();
      });
  }
}
