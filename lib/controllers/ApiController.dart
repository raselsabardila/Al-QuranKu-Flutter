import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiController {
  static Future getResponse(String url) async {
    var response = await http.get(url);
    var result = json.decode(response.body);

    return result;
  }
}