import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIservice {
  static Future<String> getGeneralFeatList(String query) async {
    String url = 'http://36639918.ngrok.io//feats/list/searchgeneral/?title=$query';
    http.Response response = await http.get(Uri.encodeFull(url));

    return response.body;
  }
  static Future<String> getAncestryList() async {
    String url = 'http://36639918.ngrok.io/ancestries/list/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
}