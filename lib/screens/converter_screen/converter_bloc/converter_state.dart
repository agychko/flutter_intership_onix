part of 'converter_bloc.dart';

@immutable
abstract class ConverterState {}

class ConverterInitial extends ConverterState {}

class ConverterLoading extends ConverterState {}

class ConverterError extends ConverterState {
  final String error;

  ConverterError(this.error);
}

class ConverterSuccess extends ConverterState {
  final Converter converter;

  ConverterSuccess(this.converter);
}