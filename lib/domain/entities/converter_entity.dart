import 'package:first/domain/entities/currency_entity.dart';

class ConverterEntity {
  CurrencyEntity currencyTop;
  CurrencyEntity currencyDown;

  ConverterEntity(this.currencyTop, this.currencyDown);
}
