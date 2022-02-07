import 'package:first/data/model/converter.dart';
import 'package:first/data/model/currency.dart';
import 'package:first/data/repository/currencies_repository.dart';
import 'package:first/data/source/currencies_source.dart';
import 'package:first/data/source/currency_hive_database.dart';
import 'package:first/data/source/preferences_source.dart';
import 'package:flutter/material.dart';

class ConverterScreenProvider extends ChangeNotifier {
  final CurrenciesRepository _currenciesRepository =
  CurrenciesRepository(CurrenciesSource(), PreferencesSource(), CurrencyHiveDatabase());

  bool isLoading = false;
  String? error;
  var topController = TextEditingController();
  var bottomController = TextEditingController();
  late Converter converter;

  ConverterScreenProvider() {
    getConverterData();
  }

  void getConverterData() async {
    isLoading = true;
    var converterData = await _currenciesRepository.getConverterData();
    if (converterData.isSuccess()) {
      converter = converterData.asSuccess().data;
      error = null;
    } else {
      error = converterData.asError().errorMessage;
    }
    isLoading = false;
    notifyListeners();
  }

  void currencyTopChanged(Currency currency) async {
    isLoading = true;
    notifyListeners();
    await _currenciesRepository.updateSelectedCurrencies(
        currency.id, converter.currencyDown.id);
    converter.currencyTop = currency;
    isLoading = false;
  }

  void currencyDownChanged(Currency currency) async {
    isLoading = true;
    notifyListeners();
    await _currenciesRepository.updateSelectedCurrencies(
        converter.currencyTop.id, currency.id);
    converter.currencyDown = currency;
    isLoading = false;
  }

  void switchCurrencies() async {
    notifyListeners();
    var currencyTop = converter.currencyTop;
    var currencyDown = converter.currencyDown;
    converter.currencyTop = currencyDown;
    converter.currencyDown = currencyTop;
    await _currenciesRepository.updateSelectedCurrencies(
        converter.currencyDown.id, converter.currencyTop.id);
  }
  void convert() async{
  (topController.text=='')?topController.text='0':topController.text=topController.text;
  bottomController.text = (double.parse(topController.text)
      * converter.currencyDown.rate
      / converter.currencyTop.rate).toStringAsFixed(4);
  topController.selection = TextSelection.fromPosition(
      TextPosition(offset: topController.text.length)
  );
  }
}