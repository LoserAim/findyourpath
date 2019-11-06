import 'package:http/http.dart' as http;

class APIservice {
  static Future<String> getGeneralFeatList(String query) async {
    String url = 'http://192.168.0.73:8000/feats/list/searchgeneral/?title=$query';
    http.Response response = await http.get(Uri.encodeFull(url));
    print(response.statusCode);
    return response.body;
  }
}