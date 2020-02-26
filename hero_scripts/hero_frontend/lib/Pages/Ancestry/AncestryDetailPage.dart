import 'package:flutter/material.dart';
import 'package:hero_frontend/Widgets/Ancestry/AncestryDetailWidget.dart';

class Ancestry_Detail_Page extends StatelessWidget {
  final int itemId;
  Ancestry_Detail_Page({this.itemId});
  @override
  Widget build(BuildContext context) {
    return Ancestry_Detail_Widget(itemId: itemId,);
  }
}