

import 'package:first/data/models/currency.dart';

class CurrencyRepository {
List <Currency> currency = [Currency.euro(),Currency.usd(),Currency.uah()];
  // List flag = [
  //   Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png',fit: BoxFit.fill), //euro
  //   Image.network('https://flagcdn.com/w80/us.png',fit: BoxFit.fill), //usd
  //   Image.network('https://flagcdn.com/w80/ua.png',fit: BoxFit.fill) //uah
  // ];
  // List icon = [
  //   SvgPicture.asset('assets/symbol_euro_icon.svg', color: const Color.fromRGBO(0, 60, 143, 1), width: 24, height: 24), //euro
  //   SvgPicture.asset('assets/currency_dollar_fee_money_icon.svg', color: const Color.fromRGBO(0, 60, 143, 1), width: 24), //usd
  //   SvgPicture.asset('assets/symbol_euro_icon.svg', color: const Color.fromRGBO(0, 60, 143, 1), width: 24, height: 24) //uah
  // ];
  // List name = [
  //   "Euro",
  //   "American Dollar",
  //   "Ukrainian Hryvnia"
  // ];
  // List symbol = [
  //   "EUR",
  //   "USD",
  //   "UAH"
  // ];
  // List rateToUah = [
  //   30.7277, //euro
  //   27.3317, //usd
  //   1, //uah
  // ];
  // CurrencyRepository();
  // CurrencyRepository.data({required this.flag, required this.icon, required this.name, required this.symbol, required this.rateToUah});
}