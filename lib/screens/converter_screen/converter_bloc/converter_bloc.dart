
import 'package:bloc/bloc.dart';
import 'package:first/data/model/converter.dart';
import 'package:first/data/model/currency.dart';
import 'package:first/data/repository/currencies_repository.dart';
import 'package:first/data/source/currencies_source.dart';
import 'package:first/data/source/currency_hive_database.dart';
import 'package:first/data/source/firebase_source.dart';
import 'package:first/data/source/preferences_source.dart';
import 'package:flutter/material.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {

  final CurrenciesRepository _currenciesRepository =
  CurrenciesRepository(CurrenciesSource(), PreferencesSource(), CurrencyHiveDatabase(), FirebaseSource());

  var topController = TextEditingController();
  var bottomController = TextEditingController();
  String topInitialValue = '';
  String downInitialValue = '';
  late Converter converter;

  ConverterBloc() : super(ConverterInitial()) {
    on<GetConverterData>((event, emit) =>_getConverterData(emit));
    on<CurrencyTopChanged>((event, emit) =>_currencyTopChanged(event, emit));
    on<CurrencyDownChanged>((event, emit) =>_currencyDownChanged(event, emit));
    on<SwitchCurrencies>((event, emit) =>_switchCurrencies(emit));
    on<Convert>((event, emit) =>_convert(event, emit));
    on<ConvertBack>((event, emit) =>_convertBack(event, emit));

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
    _convert(Convert(topInitialValue), emit);
  }

  void _currencyDownChanged(CurrencyDownChanged event, Emitter<ConverterState> emit) async {
    await _currenciesRepository.updateSelectedCurrencies(
        converter.currencyTop.id, event.currency.id);
    converter.currencyDown = event.currency;
    emit(ConverterSuccess(converter));
    _convertBack(ConvertBack(downInitialValue), emit);
  }

  void _switchCurrencies(Emitter<ConverterState> emit) async {
    var currencyTop = converter.currencyTop;
    var currencyDown = converter.currencyDown;
    converter.currencyTop = currencyDown;
    converter.currencyDown = currencyTop;
    await _currenciesRepository.updateSelectedCurrencies(
        converter.currencyDown.id, converter.currencyTop.id);
    emit(ConverterSuccess(converter));
    _convert(Convert(downInitialValue), emit);
    _convertBack(ConvertBack(downInitialValue), emit);
  }

  void _convert(Convert event, Emitter<ConverterState> emit) {
    (event.value=='')?bottomController.text='0.00':
    bottomController.text = (double.parse(event.value)
        * converter.currencyDown.rate
        / converter.currencyTop.rate).toStringAsFixed(2);
    topInitialValue=event.value;
    downInitialValue=bottomController.text;
  }

  void _convertBack(ConvertBack event, Emitter<ConverterState> emit) {
    (event.value=='')?topController.text='0.00':
    topController.text = (double.parse(event.value)
        * converter.currencyTop.rate
        / converter.currencyDown.rate).toStringAsFixed(2);
    downInitialValue=event.value;
    topInitialValue=topController.text;
  }

  // void _convert(Emitter<ConverterState> emit) {
  //   (topController.text=='')?topController.text='0':topController.text=topController.text;
  //   bottomController.text = (double.parse(topController.text)
  //       * converter.currencyDown.rate
  //       / converter.currencyTop.rate).toStringAsFixed(4);
  //   topController.selection = TextSelection.fromPosition(
  //       TextPosition(offset: topController.text.length)
  //   );
  // }

}
