
import 'package:first/data/model/converter.dart';
import 'package:first/data/model/currency.dart';
import 'package:first/data/source/currencies_source.dart';
import 'package:first/data/source/preferences_source.dart';

class CurrenciesRepository {
  final CurrenciesSource _currenciesSource;
  final PreferencesSource _preferencesSource;

  CurrenciesRepository(this._currenciesSource, this._preferencesSource);


  Future<Converter> getConverterData() async {
    var currencies = await _currenciesSource.getCurrencies();
    var idTop = await _preferencesSource.getCurrencyTopId() ?? 0;
    var idDown = await _preferencesSource.getCurrencyDownId() ?? 1;
    var currencyTop = currencies.firstWhere((item) => (item.id == idTop));
    var currencyDown = currencies.firstWhere((item) => (item.id == idDown));
    return Converter(currencyTop, currencyDown);
  }

  Future<List<Currency>> getCurrenciesList() =>
      _currenciesSource.getCurrencies();

  Future<void> updateSelectedCurrencies(int idTop, int idDown) async {
    await _preferencesSource.setCurrencyTopId(idTop);
    await _preferencesSource.setCurrencyDownId(idDown);
  }
}