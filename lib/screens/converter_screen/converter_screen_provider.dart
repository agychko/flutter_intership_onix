import 'package:first/data/model/converter.dart';
import 'package:first/data/model/currency.dart';
import 'package:first/data/repository/currencies_repository.dart';
import 'package:first/data/source/currencies_source.dart';
import 'package:first/data/source/preferences_source.dart';
import 'package:flutter/material.dart';

class ConverterScreenProvider extends ChangeNotifier {
  final CurrenciesRepository _currenciesRepository =
  CurrenciesRepository(CurrenciesSource(), PreferencesSource());

  bool isLoading = false;
  var topController = TextEditingController();
  var bottomController = TextEditingController();
  late Converter converter;

  ConverterScreenProvider() {
    _getConverterData();
    convert();
  }

  void _getConverterData() async {
    isLoading = true;
    notifyListeners();
    converter = await _currenciesRepository.getConverterData();
    isLoading = false;
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
      * converter.currencyTop.rateToUah
      / converter.currencyDown.rateToUah).toStringAsFixed(4);
  topController.selection = TextSelection.fromPosition(
      TextPosition(offset: topController.text.length)
  );
  }
}