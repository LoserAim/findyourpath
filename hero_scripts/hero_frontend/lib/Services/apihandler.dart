import 'package:flutter/cupertino.dart';
import 'package:hero_frontend/Character/Models/Character.dart';
import 'package:hero_frontend/Services/ngroklink.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
final String djangoURL = Ngrok.link;

class APIservice {
  static Future<String> getClassListIds() async {
    String url = djangoURL + 'classes/list/getIds/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getCharacterListIds() async {
    String url = djangoURL + 'characters/list/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getCharacterById(int id) async {
    String url = djangoURL + 'characters/list/' + id.toString()+'/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getCharacterByIdFull(int id) async {
    String url = djangoURL + 'characters/list/' + id.toString() +'/getFull/';
    http.Response response = await http.get(Uri.encodeFull(url));
    debugPrint(response.statusCode.toString());
    return response.body;
  }
  static Future<String> postCharacter(Character character) async {
    String url = djangoURL + 'characters/list/';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = jsonEncode(character.toJson());
    http.Response response = await http.post(Uri.encodeFull(url), headers:headers, body:json);
    return response.body;
  }
  static Future<String> getClassFeatureById(int id) async {
    String url = djangoURL + 'classes/features/' + id.toString()+'/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getClassFeatIds(int id) async {
    String url = djangoURL + 'classes/list/' + id.toString() + '/getFeats/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getAncestryFeatIds(int id) async {
    String url = djangoURL + 'ancestries/list/' + id.toString() + '/getFeats/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getClassById(int id) async {
    String url = djangoURL + 'classes/list/' + id.toString() +'/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getArchetypeById(int id) async {
    String url = djangoURL + 'classes/archetypes/' + id.toString()+'/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getProficiencyById(int id) async {
    String url = djangoURL + 'classes/proficiencies/' + id.toString()+'/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }

  static Future<String> getTraitsNamesList() async {
    String url = djangoURL + 'ancestries/traits/getnames/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }

  static Future<String> getSpecialAbilitiesList() async {
    String url = djangoURL + 'ancestries/specialabilities/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getGeneralFeatList(String query) async {
    String url = djangoURL + 'feats/list/searchgeneral/?title=$query';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }

  static Future<String> getFeatListIds() async {
    String url = djangoURL + 'feats/list/getIds';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }

  static Future<String> getFeatById(int id) async {
    String url = djangoURL + 'feats/list/' + id.toString();
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  
  static Future<String> getAncestryList() async {
    String url = djangoURL + 'ancestries/list/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getAncestryListIds() async {
    String url = djangoURL + 'ancestries/list/getIds';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getAncestryById(int id) async {
    String url = djangoURL + 'ancestries/list/' + id.toString();
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
  static Future<String> getHeritageById(int id) async {
    String url = djangoURL + 'ancestries/heritages/' + id.toString();
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
}