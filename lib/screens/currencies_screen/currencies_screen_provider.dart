
import 'package:first/data/model/currency.dart';
import 'package:first/data/repository/currencies_repository.dart';
import 'package:first/data/source/currencies_source.dart';
import 'package:first/data/source/preferences_source.dart';
import 'package:flutter/material.dart';

class CurrenciesScreenProvider extends ChangeNotifier {
  final CurrenciesRepository _currenciesRepository =
  CurrenciesRepository(CurrenciesSource(), PreferencesSource());

  bool isLoading = false;
  List<Currency> currencies = List.empty(growable: false);

  CurrenciesScreenProvider() {
    _getCurrencyList();
  }

  void _getCurrencyList() async {
    isLoading = true;
    notifyListeners();
    currencies = await _currenciesRepository.getCurrenciesList();
    isLoading = false;
    notifyListeners();
  }
}