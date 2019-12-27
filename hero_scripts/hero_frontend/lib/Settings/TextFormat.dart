import 'package:flutter/material.dart';

class Text_Format {
  static final _color1 = Colors.red[200];
  static final _color2 = Colors.red[300];
  static final _color3 = Colors.black;
  static final _color4 = Colors.black26;
  static final _color5 = Colors.white;

  final display4    = TextStyle(color: _color5, fontSize: 30.0, letterSpacing: 2.0);
  final display3    = TextStyle(color: _color1, fontSize: 26.0, fontWeight: FontWeight.w700);
  final display2    = TextStyle(color: _color1, fontSize: 24.0, fontWeight: FontWeight.w600);
  final display1    = TextStyle(color: _color1, fontSize: 22.0, fontWeight: FontWeight.w500);
  final headline    = TextStyle(color: _color2, fontSize: 20.0, fontWeight: FontWeight.w600);
  final title       = TextStyle(color: _color3, fontSize: 20.0, fontWeight: FontWeight.w500);
  final subtitle    = TextStyle(color: _color3, fontSize: 20.0, fontWeight: FontWeight.w500);
  final subhead     = TextStyle(color: _color3, fontSize: 19.0, fontWeight: FontWeight.w400);
  final body2       = TextStyle(color: _color3, fontSize: 19.0, fontWeight: FontWeight.w500);
  final body1       = TextStyle(color: _color3, fontSize: 19.0, fontWeight: FontWeight.w400);
  final caption     = TextStyle(color: _color4, fontSize: 19.0, fontWeight: FontWeight.w400);
}

final text_format = Text_Format();