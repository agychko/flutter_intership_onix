import 'package:first/domain/repository/currencies_repository.dart';

class UpdateSelectedCurrenciesUseCase {
  final CurrenciesRepository _repository;

  UpdateSelectedCurrenciesUseCase(this._repository);

  Future<void> call(int idTop, int idDown) =>
      _repository.updateSelectedCurrencies(idTop, idDown);
}
