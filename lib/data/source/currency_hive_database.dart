import 'package:first/data/model/currency.dart';
import 'package:first/data/model/currency_hive_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class CurrencyHiveDatabase {
  final String _boxName = 'currencies_box';

  Future<List<CurrencyHiveModel>> getCurrencies() async {
    var box = await Hive.openBox<CurrencyHiveModel>(_boxName);
    return box.values.toList();
  }

  Future<void> saveCurrencies(List<CurrencyHiveModel> currencies) async {
    var box = await Hive.openBox<CurrencyHiveModel>(_boxName);
    await box.addAll(currencies);
  }

  Future<void> clearCurrencies(List<CurrencyHiveModel> currencies) async {
    var box = await Hive.openBox<CurrencyHiveModel>(_boxName);
    await box.deleteAll(box.keys);
  }

  static List<Currency> mapHiveToCurrency(List<CurrencyHiveModel> input) {
    var currencies = input.map((currency) {
      return Currency(
          currency.id,
          currency.flag,
          currency.icon,
          currency.name,
          currency.symbol,
          currency.rate);
    }).toList(growable: true);
    return currencies;
  }
  static List<CurrencyHiveModel> mapCurrencyToHive(
      List<Currency> input) {
    var currencies = input.map((currency) {
      return CurrencyHiveModel(
          id: currency.id,
          flag: currency.flag,
          icon: currency.icon,
          name: currency.name,
          symbol: currency.symbol,
          rate: currency.rate);
    }).toList(growable: true);
    return currencies;
  }
}