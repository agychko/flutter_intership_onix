
import 'package:first/data/model/currency.dart';
import 'package:first/data/repository/currencies_repository.dart';
import 'package:first/data/source/currencies_source.dart';
import 'package:first/data/source/preferences_source.dart';
import 'package:flutter/material.dart';

class CurrenciesScreenProvider extends ChangeNotifier {
  final CurrenciesRepository _currenciesRepository =
  CurrenciesRepository(CurrenciesSource(), PreferencesSource());

  bool isLoading = false;
  String? error;
  List<Currency> currencies = List.empty(growable: false);

  CurrenciesScreenProvider() {
    getCurrencyList();
  }

  void getCurrencyList() async {
    isLoading = true;
    var currenciesData = await _currenciesRepository.getCurrenciesList();
    if (currenciesData.isSuccess()) {
      currencies = currenciesData.asSuccess().data;
      error = null;
    } else {
      currencies = [];
      error = currenciesData.asError().errorMessage;
    }
    isLoading = false;
    notifyListeners();
  }
}