import 'dart:io';

import 'package:first/domain/entities/currency_enity.dart';
import 'package:first/data/response/data_response.dart';

import 'dart:convert';
import 'package:first/data/response/rates.dart';
import 'package:http/http.dart' as http;

class CurrenciesSource {
  final String baseUrl = 'http://api.exchangeratesapi.io/v1/';

  Future<DataResponse<List<Currency>>> getCurrencies() async {
    try {
      var url = Uri.parse(
          '${baseUrl}latest?access_key=20d6efe31f3aa7a147dd9c380381aebe&format=1');
      var response = await http.get(url);
      var jsonResponse = jsonDecode(response.body);
      var currencies = jsonResponse['rates'];
      var rates = Rates.fromJson(currencies);

      // throw const SocketException('Error Internet');
      // throw const HttpException('Error 404');
      // throw const FormatException('Invalid Json');

      return Future.delayed(
        const Duration(milliseconds: 500),
        () => DataResponse.success([
          Currency(0, 'https://flagcdn.com/w80/ua.png', '₴', 'Ukrainian Hryvna',
              'UAH', rates.uAH!.toDouble()),
          Currency(
              1,
              // 'https://flagcdn.com/w80/eu.png',
              'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png',
              ' €',
              'Euro',
              'EUR',
              rates.eUR!.toDouble()),
          Currency(2, 'https://flagcdn.com/w80/us.png', '\$', 'American Dollar',
              'USD', rates.uSD!.toDouble()),
          Currency(3, 'https://flagcdn.com/w80/pl.png', 'zł', 'Polish Zloty',
              'PLN', rates.pLN!.toDouble()),
          Currency(4, 'https://flagcdn.com/w80/cz.png', 'Kč', 'Czech Crown',
              'CZK', rates.cZK!.toDouble()),
          Currency(5, 'https://flagcdn.com/w80/ru.png', '₽', 'Russian Ruble',
              'RUB', rates.rUB!.toDouble()),
          Currency(6, 'https://flagcdn.com/w80/gb.png', '£', 'Pound Sterling',
              'GBR', rates.gBP!.toDouble()),
          Currency(7, 'https://flagcdn.com/w80/ca.png', 'C\$',
              'Canadian Dollar', 'CAD', rates.cAD!.toDouble()),
          Currency(8, 'https://flagcdn.com/w80/au.png', 'A\$',
              'Australian Dollar', 'AUD', rates.aUD!.toDouble()),
          Currency(9, 'https://flagcdn.com/w80/jp.png', '¥', 'Japanese Yen',
              'JPY', rates.jPY!.toDouble()),
          Currency(10, 'https://flagcdn.com/w80/cn.png', '¥', 'Chinese Yuan',
              'CNY', rates.cNY!.toDouble()),
        ]),
      );
    } on SocketException {
      return DataResponse.error('Connection Error');
    } on HttpException {
      return DataResponse.error('Http Error');
    } on FormatException {
      return DataResponse.error('Bad Response');
    } catch (error) {
      return DataResponse.error('Unknown Error');
    }
  }
}
