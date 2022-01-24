


import 'package:first/data/model/converter.dart';
import 'package:first/data/repository/currencies_repository.dart';
import 'package:first/data/source/currencies_source.dart';
import 'package:first/data/source/preferences_source.dart';
import 'package:flutter/material.dart';

class ConverterScreenProvider extends ChangeNotifier {
  final CurrenciesRepository _currenciesRepository =
  CurrenciesRepository(CurrenciesSource(), PreferencesSource());

  bool isLoading = false;
  // double initialValue = 0;
  // double convertedValue = 0;
  late Converter converter;

  ConverterScreenProvider() {
    _getConverterData();
  }

  void _getConverterData() async {
    isLoading = true;
    notifyListeners();
    converter = await _currenciesRepository.getConverterData();
    isLoading = false;
    notifyListeners();
  }

}