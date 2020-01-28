

import 'package:flutter/material.dart';
import 'package:hero_frontend/BusinessLogic/Providers/AncestryProvider.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestrySelectorPage.dart';
import 'package:hero_frontend/Widgets/Ancestry/AncestryDetailWidget.dart';
//import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';

void main() {
  runApp(Ancestry_Provider(
    child: new MaterialApp(
      title: "Select your crapp",
      onGenerateRoute: routes,
    ),
  ));
}

Route routes(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) {
        final bloc = Ancestry_Provider.of(context);
        bloc.fetchTopIds();
        return AncestrySelectorPage();
      });
    case "/id=":
      return MaterialPageRoute(builder: (context) {
        final int itemId = int.parse(settings.name.replaceFirst('/id=', ''));
        return Ancestry_Detail_Widget(itemId: itemId,);
      });
  }
}
