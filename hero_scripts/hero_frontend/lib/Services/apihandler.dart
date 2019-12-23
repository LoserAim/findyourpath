import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String djangoURL = 'http://213a7b1b.ngrok.io/';

class APIservice {
  static Future<String> getGeneralFeatList(String query) async {
    String url = djangoURL + 'feats/list/searchgeneral/?title=$query';
    http.Response response = await http.get(Uri.encodeFull(url));

    return response.body;
  }
  static Future<String> getAncestryList() async {
    String url = djangoURL + 'ancestries/list/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
}