import 'package:flutter/material.dart';
class Currency {
  var flag = Image.network('');
  String name = "undefined";
  String symbol = "undefined";
  double rateToUah = 1;

  Currency();
  Currency.usd() {
    flag = Image.network('https://flagcdn.com/w80/us.png');
    name = "Долар США";
    symbol = "USD";
    rateToUah = 27.3317;
  }
  Currency.euro() {
    flag = Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png');
    name = "Євро";
    symbol = "EUR";
    rateToUah = 30.7277;
  }
  Currency.uah() {
    flag = flag = Image.network('https://flagcdn.com/w80/ua.png');
    name = "Гривня";
    symbol = "UAH";
    rateToUah = 1;
  }
}
