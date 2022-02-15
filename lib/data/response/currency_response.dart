
import 'package:first/data/response/rates.dart';

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