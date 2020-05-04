import 'dart:convert';

import 'package:http/http.dart' as http;

class GraphQLData {
  Future<http.Response> query(String query) async {
    String body = jsonEncode(<String,String>{'query':query});
    var s = await http.post('http://34.87.47.86/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
        return s;
  }
}
