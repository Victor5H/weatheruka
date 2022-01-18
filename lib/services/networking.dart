import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url});

  final String ? url;

  Future getDecodedData() async {
    Uri uri=Uri.parse(url!);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data); // returns dynamic
    } else
      print(response.statusCode);
  }
}
