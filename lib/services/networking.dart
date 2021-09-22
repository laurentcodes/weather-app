import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final Uri url;

  Future getData() async {
    var res = await http.get(url);

    if (res.statusCode == 200) {
      var data = res.body;

      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      print(res.statusCode);
    }
  }
}
