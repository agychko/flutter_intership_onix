part of 'currencies_bloc.dart';

@immutable
abstract class CurrenciesState {}

class CurrenciesInitial extends CurrenciesState {}

class CurrenciesLoading extends CurrenciesState {}

class CurrenciesError extends CurrenciesState{
  final String error;
  CurrenciesError(this.error);
}

class CurrenciesSuccess extends CurrenciesState {
  final List<Currency> currencies;
  CurrenciesSuccess(this.currencies);
}
