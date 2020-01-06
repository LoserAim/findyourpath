import 'package:flutter/material.dart';
import 'package:hero_frontend/Pages/Ancestry/AncestrySelectorPage.dart';
import 'package:hero_frontend/Pages/Feat/FeatSelectorPage.dart';


void main(){
  runApp(new MaterialApp(
    title: "Select your crapp",
   home: new AncestrySelectorPage(),
   //home: new FeatSelectorPage(),
  ));
}