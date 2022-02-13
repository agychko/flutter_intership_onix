
import 'package:bloc/bloc.dart';
import 'package:first/data/model/converter.dart';
import 'package:first/data/model/currency.dart';
import 'package:first/data/repository/currencies_repository.dart';
import 'package:first/data/source/currencies_source.dart';
import 'package:first/data/source/currency_hive_database.dart';
import 'package:first/data/source/preferences_source.dart';
import 'package:flutter/material.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {

  final CurrenciesRepository _currenciesRepository =
  CurrenciesRepository(CurrenciesSource(), PreferencesSource(), CurrencyHiveDatabase());

  var topController = TextEditingController();
  var bottomController = TextEditingController();
  late Converter converter;

  ConverterBloc() : super(ConverterInitial()) {
    on<GetConverterData>((event, emit) =>_getConverterData(emit));
    on<CurrencyTopChanged>((event, emit) =>_currencyTopChanged(event, emit));
    on<CurrencyDownChanged>((event, emit) =>_currencyDownChanged(event, emit));
    on<SwitchCurrencies>((event, emit) =>_switchCurrencies(emit));
    on<Convert>((event, emit) =>_convert(emit));

    add(GetConverterData());
  }

  void _getConverterData(Emitter<ConverterState> emit) async {
    emit(ConverterLoading());
    var converterData = await _currenciesRepository.getConverterData();
    if (converterData.isSuccess()) {
      converter = converterData.asSuccess().data;
      emit(ConverterSuccess(converter));
    } else {
      emit(ConverterError(converterData.asError().errorMessage));
    }
  }

  void _currencyTopChanged(CurrencyTopChanged event, Emitter<ConverterState> emit) async {
    await _currenciesRepository.updateSelectedCurrencies(
        event.currency.id, converter.currencyDown.id);
    converter.currencyTop = event.currency;
    emit(ConverterSuccess(converter));
  }

  void _currencyDownChanged(CurrencyDownChanged event, Emitter<ConverterState> emit) async {

    await _currenciesRepository.updateSelectedCurrencies(
        converter.currencyTop.id, event.currency.id);
    converter.currencyDown = event.currency;
    emit(ConverterSuccess(converter));
  }

  void _switchCurrencies(Emitter<ConverterState> emit) async {
    var currencyTop = converter.currencyTop;
    var currencyDown = converter.currencyDown;
    converter.currencyTop = currencyDown;
    converter.currencyDown = currencyTop;
    await _currenciesRepository.updateSelectedCurrencies(
        converter.currencyDown.id, converter.currencyTop.id);
    emit(ConverterSuccess(converter));
  }
  void _convert(Emitter<ConverterState> emit) {
    (topController.text=='')?topController.text='0':topController.text=topController.text;
    bottomController.text = (double.parse(topController.text)
        * converter.currencyDown.rate
        / converter.currencyTop.rate).toStringAsFixed(4);
    topController.selection = TextSelection.fromPosition(
        TextPosition(offset: topController.text.length)
    );
  }

}
