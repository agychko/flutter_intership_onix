
import 'dart:convert';
import 'package:first/data/model/currency.dart';
import 'package:first/data/model/rates.dart';
import 'package:http/http.dart' as http;

class RatesApi {
  final String baseUrl = 'http://api.exchangeratesapi.io/v1/';

  Future<Object> getRates() async {
    try {
      var url = Uri.parse('${baseUrl}latest?access_key=20d6efe31f3aa7a147dd9c380381aebe&format=1');
      var response = await http.get(url);
      var jsonResponse = jsonDecode(response.body);
      var currencies = jsonResponse['rates'];
      var rates = Rates.fromJson(currencies);
      // var currencies = jsonResponse
      //     .map((json) => CurrencyResponse.fromJson(json as Map<String, dynamic>));
      // print("Response status: ${response.statusCode}");
      // print("Response body: ${response.body}");
      // print(rates.aUD);
      return Future.delayed(
          const Duration(milliseconds: 500),
              () => [
        Currency(
            0,
            'https://flagcdn.com/w80/ua.png',
            '₴',
            'Ukrainian Hryvna',
            'UAH',
            rates.uAH!.toDouble()
            // 1.0
        ),
        Currency(
            1,
            // 'https://flagcdn.com/w80/eu.png',
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png',
            ' €',
            'Euro',
            'EUR',
            30.7277
        ),
        Currency(
            2,
            'https://flagcdn.com/w80/us.png',
            '\$',
            'American dollar',
            'USD',
            27.3317
        )
      ]);
    } catch (error) {
      return Exception('Unknown Error');
    }
  }
}