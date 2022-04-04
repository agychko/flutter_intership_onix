import 'package:flutter/material.dart';

import '../../model/local/currency_hive_model.dart';

abstract class CurrencyHiveDatabase {
  @protected
  final String boxName = 'currencies_box';

  Future<List<CurrencyHiveModel>> getCurrencies();

  Future<void> saveCurrencies(List<CurrencyHiveModel> currencies);

  Future<void> clearCurrencies(List<CurrencyHiveModel> currencies);
}
