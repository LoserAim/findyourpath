import 'package:http/http.dart' as http;

const String djangoURL = 'http://906116a7.ngrok.io/';

class APIservice {
  static Future<String> getTraitsNamesList() async {
    String url = djangoURL + 'ancestries/traits/getnames/';
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
}