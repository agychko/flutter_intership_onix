import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Currency {
  var flag = Image.network('');
  var icon = SvgPicture.asset('');
  String name = "undefined";
  String symbol = "undefined";
  double rateToUah = 1;

  Currency();
  Currency.usd() {
    flag = Image.network('https://flagcdn.com/w80/us.png',fit: BoxFit.fill);
    icon = SvgPicture.asset('assets/currency_dollar_fee_money_icon.svg', color: const Color.fromRGBO(0, 60, 143, 1), width: 24,);
    name = "Долар США";
    symbol = "USD";
    rateToUah = 27.3317;
  }
  Currency.euro() {
    flag = Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png',fit: BoxFit.fill);
    icon = SvgPicture.asset('assets/symbol_euro_icon.svg', color: const Color.fromRGBO(0, 60, 143, 1), width: 24, height: 24,);
    name = "Євро";
    symbol = "EUR";
    rateToUah = 30.7277;
  }
  Currency.uah() {
    flag = Image.network('https://flagcdn.com/w80/ua.png',fit: BoxFit.fill);
    icon = SvgPicture.asset('assets/hryvnia_sign_icon.svg', color: const Color.fromRGBO(0, 60, 143, 1), width: 24,);
    name = "Гривня";
    symbol = "UAH";
    rateToUah = 1;
  }
}
