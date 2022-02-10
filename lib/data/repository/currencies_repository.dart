
import 'dart:developer';

import 'package:first/data/model/converter.dart';
import 'package:first/data/model/currency.dart';
import 'package:first/data/response/data_response.dart';
import 'package:first/data/source/currencies_source.dart';
import 'package:first/data/source/currency_hive_database.dart';
import 'package:first/data/source/preferences_source.dart';

class CurrenciesRepository {
  final CurrenciesSource _currenciesSource;
  final PreferencesSource _preferencesSource;
  final CurrencyHiveDatabase _databaseSource;

  CurrenciesRepository(this._currenciesSource, this._preferencesSource, this._databaseSource);

  Future<DataResponse<Converter>> getConverterData() async {
    //check database
    log('----Start');
    var dbCurrencies = await _databaseSource.getCurrencies();
    log('----Checked Database, ${dbCurrencies.length} items in database.');
    var updateInterval = await _preferencesSource.getUpdateInterval()??60;
    var updateTime = await _preferencesSource.getUpdateTime()??1644418455937;
    log('-----Update Interval is $updateInterval second');
    var dt = DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(updateTime.toInt())).inSeconds.toInt();
    log('-----Last update $dt second ago');
    if (dbCurrencies.isNotEmpty && dt < updateInterval.toInt()) {
        //map from db to currency and return result
        var currencies = CurrencyHiveDatabase.mapHiveToCurrency(dbCurrencies);
        var converter = await _createConverter(currencies);
        log('----Return Result From Database');
        return DataResponse.success(converter);
    }
    var currencyResponse = await _currenciesSource.getCurrencies();
    var newUpdateTime = DateTime.now().millisecondsSinceEpoch;
    await _preferencesSource.setUpdateTime(newUpdateTime);
    log('-----New Update Time');
    log('----Api Call');
    if (currencyResponse.isSuccess()) {
      //save to db
      var dbCurrencies =
      CurrencyHiveDatabase.mapCurrencyToHive(currencyResponse.asSuccess().data);
      log('----Saving Currencies to Database');
      await _databaseSource.clearCurrencies(dbCurrencies);
      await _databaseSource.saveCurrencies(dbCurrencies);
      log('----Saved ${dbCurrencies.length} currencies to Database');
      log('----In Database ${dbCurrencies.length} items.');
      //create converter
      var currencies = currencyResponse.asSuccess().data;
      var converter = await _createConverter(currencies);
      log('----Return Result From Api');
      return DataResponse.success(converter);
    }
      log('----Api Call, Error: ${currencyResponse.asError().errorMessage}');
      return DataResponse.error(currencyResponse.asError().errorMessage);
  }

  Future<Converter> _createConverter(List<Currency> currencies) async {
    var idTop = await _preferencesSource.getCurrencyTopId() ?? 0;
    var idDown = await _preferencesSource.getCurrencyDownId() ?? 1;
    var currencyTop = currencies.firstWhere((item) => (item.id == idTop));
    var currencyDown = currencies.firstWhere((item) => (item.id == idDown));
    return Converter(currencyTop, currencyDown);
  }

  Future<DataResponse<List<Currency>>> getCurrenciesList() async {
    log('----Checking the list of currencies');
    var dbCurrencies = await _databaseSource.getCurrencies();
    log('----Checked Database, ${dbCurrencies.length} items in database.');
    var updateInterval = await _preferencesSource.getUpdateInterval()??60;
    var updateTime = await _preferencesSource.getUpdateTime()??1644418455937;
    log('-----Update Interval is ${updateInterval.toInt()} second');
    var dt = DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(updateTime.toInt())).inSeconds.toInt();
    log('-----Last update $dt second ago');
    if (dbCurrencies.isNotEmpty && dt < updateInterval.toInt()) {
      var currencies = CurrencyHiveDatabase.mapHiveToCurrency(dbCurrencies);
      log('----Return Result From Database');
      return DataResponse.success(currencies);
    }
    var newUpdateTime = DateTime.now().millisecondsSinceEpoch;
    await _preferencesSource.setUpdateTime(newUpdateTime);
    log('-----New Update Time');
    log('-------------Api Call');
    var currencyResponse = await _currenciesSource.getCurrencies();
    if (currencyResponse.isSuccess()) {
      var dbCurrencies =
      CurrencyHiveDatabase.mapCurrencyToHive(currencyResponse.asSuccess().data);
      await _databaseSource.clearCurrencies(dbCurrencies);
      await _databaseSource.saveCurrencies(dbCurrencies);
      log('----Return Result From Api');
      return DataResponse.success(currencyResponse.asSuccess().data);
    }
    log('----Api Call, Error: ${currencyResponse.asError().errorMessage}');
    return DataResponse.error(currencyResponse.asError().errorMessage);
  }

  Future<void> updateSelectedCurrencies(int idTop, int idDown) async {
    await _preferencesSource.setCurrencyTopId(idTop);
    await _preferencesSource.setCurrencyDownId(idDown);
  }

}