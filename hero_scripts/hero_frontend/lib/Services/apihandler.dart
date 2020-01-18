import 'package:http/http.dart' as http;

const String djangoURL = 'http://34d4e16e.ngrok.io/';

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