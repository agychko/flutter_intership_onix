
import 'dart:convert';

// import 'package:first/data/model/currency_response.dart';
import 'package:http/http.dart' as http;

class RatesApi {
  final String baseUrl = 'http://api.exchangeratesapi.io/v1/';

  void getRates() async {
    try {
      var url = Uri.parse(
          '${baseUrl}latest?access_key=20d6efe31f3aa7a147dd9c380381aebe&format=1');
      var response = await http.get(url);
      var jsonResponse = jsonDecode(response.body);

      print("Response status: ${response.statusCode}");
      // print("Response body: ${response.body}");
      print(jsonResponse);
    } catch (error) {
      print(error);
    }
  }
}