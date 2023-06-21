import 'dart:convert';

import 'package:http/http.dart' as http;

class UserServices {
  var client = http.Client();
  Uri baseURL = Uri.parse("https://api.dev.lifttaxi.lk/users/");

  Future<http.Response> postUserDetails(String url, body, token) async {
    var service_providerURL = baseURL.toString() + url;
    var _headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    };

    String rawJson = jsonEncode(body);
    return await client.post(Uri.parse(service_providerURL),
        headers: _headers, body: rawJson);
  }

  Future<http.Response> getAllServiceProviders(String url, token) async {
    var service_providerURL = baseURL.toString() + url;
    var _headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    };
    return await client.get(Uri.parse(service_providerURL), headers: _headers);
  }
}
