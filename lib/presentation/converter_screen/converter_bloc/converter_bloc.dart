import 'package:bloc/bloc.dart';
import 'package:first/domain/entities/converter_entity.dart';
import 'package:first/domain/entities/currency_entity.dart';
import 'package:first/domain/usecase/get_converter_data_use_case.dart';
import 'package:first/domain/usecase/update_selected_currencies_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  final GetConverterDataUseCase _getConverterDataUseCase =
      GetIt.instance<GetConverterDataUseCase>();
  final UpdateSelectedCurrenciesUseCase _updateSelectedCurrenciesUseCase =
      GetIt.instance<UpdateSelectedCurrenciesUseCase>();

  var topController = TextEditingController();
  var bottomController = TextEditingController();
  String topInitialValue = '';
  String downInitialValue = '';
  late ConverterEntity converter;

  ConverterBloc() : super(ConverterInitial()) {
    on<GetConverterData>((event, emit) => _getConverterData(emit));
    on<CurrencyTopChanged>((event, emit) => _currencyTopChanged(event, emit));
    on<CurrencyDownChanged>((event, emit) => _currencyDownChanged(event, emit));
    on<SwitchCurrencies>((event, emit) => _switchCurrencies(emit));
    on<Convert>((event, emit) => _convert(event, emit));
    on<ConvertBack>((event, emit) => _convertBack(event, emit));

    add(GetConverterData());
  }

  void _getConverterData(Emitter<ConverterState> emit) async {
    emit(ConverterLoading());
    var converterData = await _getConverterDataUseCase();
    if (converterData.isSuccess()) {
      converter = converterData.asSuccess().data;
      emit(ConverterSuccess(converter));
    } else {
      emit(ConverterError(converterData.asError().errorMessage));
    }
  }

  void _currencyTopChanged(
      CurrencyTopChanged event, Emitter<ConverterState> emit) async {
    await _updateSelectedCurrenciesUseCase(
        event.currency.id, converter.currencyDown.id);
    converter.currencyTop = event.currency;
    emit(ConverterSuccess(converter));
    _convert(Convert(topInitialValue), emit);
  }

  void _currencyDownChanged(
      CurrencyDownChanged event, Emitter<ConverterState> emit) async {
    await _updateSelectedCurrenciesUseCase(
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
    await _updateSelectedCurrenciesUseCase(
        converter.currencyDown.id, converter.currencyTop.id);
    emit(ConverterSuccess(converter));
    _convert(Convert(downInitialValue), emit);
    _convertBack(ConvertBack(downInitialValue), emit);
  }

  void _convert(Convert event, Emitter<ConverterState> emit) {
    (event.value == '')
        ? bottomController.text = '0.00'
        : bottomController.text = (double.parse(event.value) *
                converter.currencyDown.rate /
                converter.currencyTop.rate)
            .toStringAsFixed(2);
    topInitialValue = event.value;
    downInitialValue = bottomController.text;
  }

  void _convertBack(ConvertBack event, Emitter<ConverterState> emit) {
    (event.value == '')
        ? topController.text = '0.00'
        : topController.text = (double.parse(event.value) *
                converter.currencyTop.rate /
                converter.currencyDown.rate)
            .toStringAsFixed(2);
    downInitialValue = event.value;
    topInitialValue = topController.text;
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
