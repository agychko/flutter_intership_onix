

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
    if (dbCurrencies.isNotEmpty) {

      //map from db to currency and return result
      // var currencies = CurrencyMapper.mapDbToCurrency(dbCurrencies);
      var currencies = CurrencyHiveDatabase.mapHiveToCurrency(dbCurrencies);
      var converter = await _createConverter(currencies);
      log('----Return Result From Database');
      return DataResponse.success(converter);
    }

    var currencyResponse = await _currenciesSource.getCurrencies();
    log('----Api Call');
    if (currencyResponse.isSuccess()) {
      //save to db
      //var dbCurrencies =
      //    CurrencyMapper.mapCurrencyToDb(currencyResponse.asSuccess().data);
      var dbCurrencies =
      CurrencyHiveDatabase.mapCurrencyToHive(currencyResponse.asSuccess().data);
      log('----Saving Currencies to Database');
      await _databaseSource.saveCurrencies(dbCurrencies);
      log('----Saved ${dbCurrencies.length} currencies to Database');
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

  Future<DataResponse<Converter>> getConverterDat() async {
    var currenciesData = await _currenciesSource.getCurrencies();
    if (currenciesData.isSuccess()) {
      var currencies = currenciesData.asSuccess().data;
    var idTop = await _preferencesSource.getCurrencyTopId() ?? 0;
    var idDown = await _preferencesSource.getCurrencyDownId() ?? 1;
    var currencyTop = currencies.firstWhere((item) => (item.id == idTop));
    var currencyDown = currencies.firstWhere((item) => (item.id == idDown));
    return DataResponse.success(Converter(currencyTop, currencyDown));
  }
    return DataResponse.error(currenciesData.asError().errorMessage);
  }

  Future<DataResponse<List<Currency>>> getCurrenciesList() =>
      _currenciesSource.getCurrencies();

  Future<void> updateSelectedCurrencies(int idTop, int idDown) async {
    await _preferencesSource.setCurrencyTopId(idTop);
    await _preferencesSource.setCurrencyDownId(idDown);
  }
}