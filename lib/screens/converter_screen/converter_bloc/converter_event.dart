part of 'converter_bloc.dart';

@immutable
abstract class ConverterEvent {}

class GetConverterData extends ConverterEvent{}

class CurrencyTopChanged extends ConverterEvent{

final Currency currency;

CurrencyTopChanged(this.currency);
}

class CurrencyDownChanged extends ConverterEvent{

  final Currency currency;

  CurrencyDownChanged(this.currency);
}

class SwitchCurrencies extends ConverterEvent{}

class Convert extends ConverterEvent{
  final String value;
  Convert(this.value);
}
class ConvertBack extends ConverterEvent{
  final String value;
  ConvertBack(this.value);
}
