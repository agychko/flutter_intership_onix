import 'package:first/data/model/local/currency_hive_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../currency_hive_database.dart';

class CurrencyHiveDatabaseImpl extends CurrencyHiveDatabase {
  @override
  Future<List<CurrencyHiveModel>> getCurrencies() async {
    var box = await Hive.openBox<CurrencyHiveModel>(boxName);
    return box.values.toList();
  }

  @override
  Future<void> saveCurrencies(List<CurrencyHiveModel> currencies) async {
    var box = await Hive.openBox<CurrencyHiveModel>(boxName);
    await box.addAll(currencies);
  }

  @override
  Future<void> clearCurrencies(List<CurrencyHiveModel> currencies) async {
    var box = await Hive.openBox<CurrencyHiveModel>(boxName);
    await box.deleteAll(box.keys);
  }
}
