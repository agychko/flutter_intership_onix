import 'package:first/data/model/local/currency_hive_model.dart';
import 'package:first/domain/entities/currency_entity.dart';

class CurrencyMapper {
  static List<CurrencyEntity> mapHiveToCurrency(List<CurrencyHiveModel> input) {
    var currencies = input.map((currency) {
      return CurrencyEntity(currency.id, currency.flag, currency.icon,
          currency.name, currency.symbol, currency.rate);
    }).toList(growable: true);
    return currencies;
  }

  static List<CurrencyHiveModel> mapCurrencyToHive(List<CurrencyEntity> input) {
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
