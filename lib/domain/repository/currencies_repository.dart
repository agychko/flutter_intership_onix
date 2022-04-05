import 'package:first/data/model/data/data_response.dart';
import 'package:first/domain/entities/converter_entity.dart';
import 'package:first/domain/entities/currency_entity.dart';

abstract class CurrenciesRepository {
  Future<DataResponse<ConverterEntity>> getConverterData();

  Future<ConverterEntity> createConverter(List<CurrencyEntity> currencies);

  Future<DataResponse<List<CurrencyEntity>>> getCurrenciesList();

  Future<void> updateSelectedCurrencies(int idTop, int idDown);
}
