import 'package:first/data/model/data/data_response.dart';
import 'package:first/domain/entities/currency_entity.dart';
import 'package:flutter/material.dart';

abstract class CurrenciesSource {
  @protected
  final String baseUrl = 'http://api.exchangeratesapi.io/v1/';

  Future<DataResponse<List<CurrencyEntity>>> getCurrencies();
}
