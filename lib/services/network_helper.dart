import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future getMenu() async {
    http.Response response = await http.post(Uri.parse(url), body: {
      'token':
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxYTcxMjczYjJjZjQ2OWNiMTY2OWIyMSIsInVzZXJuYW1lIjoiRmFyZWV6IiwiaWF0IjoxNjQxMTkxODYxLCJleHAiOjE2NDExOTU0NjF9.YFLw4OBh3w-kI1r_IKqePpVSJrn7Jyr4fe76xO1Qeh4"
    });
    print(response.body.toString());
    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    } else {
      throw Exception('Unable to get menu');
    }
  }
}
