import 'package:first/data/model/data/data_response.dart';
import 'package:first/domain/entities/currency_entity.dart';
import 'package:first/domain/repository/currencies_repository.dart';

class GetCurrenciesListUseCase {
  final CurrenciesRepository _repository;

  GetCurrenciesListUseCase(this._repository);

  Future<DataResponse<List<CurrencyEntity>>> call() =>
      _repository.getCurrenciesList();
}
