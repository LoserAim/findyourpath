import 'package:flutter/material.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestryProvider.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestrySelectorPage.dart';
//import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';


void main(){
  runApp(Ancestry_Provider(
      child: new MaterialApp(
      title: "Select your crapp",
     home: AncestrySelectorPage(),
     //home: new FeatSelectorPage(),
    ),
  ));
}