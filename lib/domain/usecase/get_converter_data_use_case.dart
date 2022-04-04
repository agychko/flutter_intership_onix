import 'package:first/data/model/data/data_response.dart';
import 'package:first/domain/entities/converter_entity.dart';
import 'package:first/domain/repository/currencies_repository.dart';

class GetConverterDataUseCase {
  final CurrenciesRepository _repository;

  GetConverterDataUseCase(this._repository);

  Future<DataResponse<ConverterEntity>> call() =>
      _repository.getConverterData();
}
