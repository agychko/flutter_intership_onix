import 'package:first/domain/entities/converter_entity.dart';
import 'package:first/domain/entities/currency_entity.dart';
import 'package:first/domain/repository/currencies_repository.dart';

class CreateConverterUseCase {
  final CurrenciesRepository _repository;

  CreateConverterUseCase(this._repository);

  Future<ConverterEntity> call(List<CurrencyEntity> currencies) =>
      _repository.createConverter(currencies);
}
