import 'package:bloc/bloc.dart';
import 'package:first/domain/entities/currency_entity.dart';
import 'package:first/domain/usecase/get_currencies_list_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'currencies_event.dart';
part 'currencies_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final GetCurrenciesListUseCase _getCurrenciesUseCase =
      GetIt.instance<GetCurrenciesListUseCase>();

  List<CurrencyEntity> currencies = List.empty(growable: false);

  CurrenciesBloc() : super(CurrenciesInitial()) {
    on<GetCurrencyList>((event, emit) => _getCurrencyList(emit));

    add(GetCurrencyList());
  }
  void _getCurrencyList(Emitter<CurrenciesState> emit) async {
    emit(CurrenciesLoading());
    var currenciesData = await _getCurrenciesUseCase();
    if (currenciesData.isSuccess()) {
      currencies = currenciesData.asSuccess().data;
      emit(CurrenciesSuccess(currencies));
    } else {
      emit(CurrenciesError(currenciesData.asError().errorMessage));
    }
  }
}
