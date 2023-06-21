import 'dart:convert';

import 'package:http/http.dart' as http;

class CustomerService {
  var client = http.Client();
  Uri baseURL = Uri.parse("https://api.dev.lifttaxi.lk/users/");

  Future<http.Response> postCustomerDetails(String url, body, token) async {
    var service_providerURL = baseURL.toString() + url;
    var _headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer ${token}"
    };

    String rawJson = jsonEncode(body);
    return await client.post(Uri.parse(service_providerURL),
        headers: _headers, body: rawJson);
  }
}
