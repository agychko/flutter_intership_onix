import 'rates.dart';

class CurrencyResponse {
  bool? success;
  int? timestamp;
  String? base;
  String? date;
  Rates? rates;

  CurrencyResponse(
      {this.success, this.timestamp, this.base, this.date, this.rates});

  CurrencyResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    timestamp = json['timestamp'];
    base = json['base'];
    date = json['date'];
    rates = json['rates'] != null ? Rates.fromJson(json['rates']) : null;
  }
}

// class CurrencyResponse {
//   final String ccy;
//   final String baseCCy;
//   final String buy;
//   final String sale;
//
//   CurrencyResponse(
//       {required this.ccy,
//         required this.baseCCy,
//         required this.buy,
//         required this.sale});
//
//   factory CurrencyResponse.fromJson(Map<dynamic, dynamic> json) {
//     return CurrencyResponse(
//         ccy: json['ccy'],
//         baseCCy: json['base_ccy'],
//         buy: json['buy'],
//         sale: json['sale']);
//   }
// }