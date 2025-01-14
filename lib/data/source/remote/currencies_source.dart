import 'package:first/data/model/data/data_response.dart';
import 'package:first/domain/entities/currency_entity.dart';
import 'package:flutter/material.dart';

abstract class CurrenciesSource {
  @protected
  // final String baseUrl = 'http://api.exchangeratesapi.io/v1/';
  final String baseUrl = 'https://api.exchangerate.host/latest';

  Future<DataResponse<List<CurrencyEntity>>> getCurrencies();
}
