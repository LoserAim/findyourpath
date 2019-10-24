import 'package:http/http.dart' as http;

class APIservice {
  static Future<String> getFeatList() async {
    String url = 'http://192.168.0.73:8000/feats/list/';
    http.Response response = await http.get(Uri.encodeFull(url));
    return response.body;
  }
}