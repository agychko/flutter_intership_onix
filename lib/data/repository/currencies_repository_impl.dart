import 'dart:developer';

import 'package:first/data/model/mapper/currency_mapper.dart';
import 'package:first/domain/entities/converter_entity.dart';
import 'package:first/domain/entities/currency_entity.dart';
import 'package:first/data/model/data/data_response.dart';
import 'package:first/data/source/remote/currencies_source.dart';
import 'package:first/data/source/local/currency_hive_database.dart';
import 'package:first/data/source/remote/firebase_source.dart';
import 'package:first/data/source/local/preferences_source.dart';
import 'package:first/domain/repository/currencies_repository.dart';

class CurrenciesRepositoryImpl extends CurrenciesRepository {
  final CurrenciesSource _currenciesSource;
  final PreferencesSource _preferencesSource;
  final CurrencyHiveDatabase _databaseSource;
  final FirebaseSource _firebaseSource;

  CurrenciesRepositoryImpl(this._currenciesSource, this._preferencesSource,
      this._databaseSource, this._firebaseSource);

  @override
  Future<DataResponse<ConverterEntity>> getConverterData() async {
    //check database
    log('----Start');
    var dbCurrencies = await _databaseSource.getCurrencies();
    log('----Checked Database, ${dbCurrencies.length} items in database.');
    var updateInterval = await _preferencesSource.getUpdateInterval() ?? 15;
    var updateTime = await _preferencesSource.getUpdateTime() ?? 1644418455937;
    log('-----Update Interval is $updateInterval second');
    var dt = DateTime.now()
        .difference(DateTime.fromMillisecondsSinceEpoch(updateTime.toInt()))
        .inSeconds
        .toInt();
    log('-----Last update $dt second ago');
    if (dbCurrencies.isNotEmpty && dt < updateInterval.toInt()) {
      //map from db to currency and return result
      var currencies = CurrencyMapper.mapHiveToCurrency(dbCurrencies);
      var converter = await createConverter(currencies);
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
          CurrencyMapper.mapCurrencyToHive(currencyResponse.asSuccess().data);
      log('----Saving Currencies to Database');
      await _databaseSource.clearCurrencies(dbCurrencies);
      await _databaseSource.saveCurrencies(dbCurrencies);
      log('----Saved ${dbCurrencies.length} currencies to Database');
      log('----In Database ${dbCurrencies.length} items.');
      //create converter
      var currencies = currencyResponse.asSuccess().data;
      var converter = await createConverter(currencies);
      log('----Return Result From Api');
      return DataResponse.success(converter);
    }
    log('----Api Call, Error: ${currencyResponse.asError().errorMessage}');
    return DataResponse.error(currencyResponse.asError().errorMessage);
  }

  @override
  Future<ConverterEntity> createConverter(List<CurrencyEntity> currencies) async {
    // var idTop = await _preferencesSource.getCurrencyTopId() ?? 0;
    // var idDown = await _preferencesSource.getCurrencyDownId() ?? 1;

    var idTop = await _firebaseSource.getCurrencyTopId() ?? 0;
    var idDown = await _firebaseSource.getCurrencyDownId() ?? 1;

    var currencyTop = currencies.firstWhere((item) => (item.id == idTop));
    var currencyDown = currencies.firstWhere((item) => (item.id == idDown));
    return ConverterEntity(currencyTop, currencyDown);
  }

  @override
  Future<DataResponse<List<CurrencyEntity>>> getCurrenciesList() async {
    log('----Checking the list of currencies');
    var dbCurrencies = await _databaseSource.getCurrencies();
    log('----Checked Database, ${dbCurrencies.length} items in database.');
    var updateInterval = await _preferencesSource.getUpdateInterval() ?? 15;
    var updateTime = await _preferencesSource.getUpdateTime() ?? 1644418455937;
    log('-----Update Interval is ${updateInterval.toInt()} second');
    var dt = DateTime.now()
        .difference(DateTime.fromMillisecondsSinceEpoch(updateTime.toInt()))
        .inSeconds
        .toInt();
    log('-----Last update $dt second ago');
    if (dbCurrencies.isNotEmpty && dt < updateInterval.toInt()) {
      var currencies = CurrencyMapper.mapHiveToCurrency(dbCurrencies);
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
          CurrencyMapper.mapCurrencyToHive(currencyResponse.asSuccess().data);
      await _databaseSource.clearCurrencies(dbCurrencies);
      await _databaseSource.saveCurrencies(dbCurrencies);
      log('----Return Result From Api');
      return DataResponse.success(currencyResponse.asSuccess().data);
    }
    log('----Api Call, Error: ${currencyResponse.asError().errorMessage}');
    return DataResponse.error(currencyResponse.asError().errorMessage);
  }

  @override
  Future<void> updateSelectedCurrencies(int idTop, int idDown) async {
    // await _preferencesSource.setCurrencyTopId(idTop);
    // await _preferencesSource.setCurrencyDownId(idDown);

    await _firebaseSource.setCurrencyTopId(idTop);
    await _firebaseSource.setCurrencyDownId(idDown);
  }
}
