import 'package:flutter/material.dart';
class Currency {
  var flag = Image.network('');
  var icon = const Icon(Icons.import_export);
  String name = "undefined";
  String symbol = "undefined";
  double rateToUah = 1;

  Currency();
  Currency.usd() {
    flag = Image.network('https://flagcdn.com/w80/us.png',fit: BoxFit.fill);
    icon = const Icon(Icons.attach_money);
    name = "Долар США";
    symbol = "USD";
    rateToUah = 27.3317;
  }
  Currency.euro() {
    flag = Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png',fit: BoxFit.fill);
    icon = const Icon(Icons.euro);
    name = "Євро";
    symbol = "EUR";
    rateToUah = 30.7277;
  }
  Currency.uah() {
    flag = Image.network('https://flagcdn.com/w80/ua.png',fit: BoxFit.fill);

    name = "Гривня";
    symbol = "UAH";
    rateToUah = 1;
  }
}
