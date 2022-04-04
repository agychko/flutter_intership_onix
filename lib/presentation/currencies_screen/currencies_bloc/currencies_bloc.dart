import 'package:bloc/bloc.dart';
import 'package:first/domain/entities/currency_enity.dart';
import 'package:first/data/repository/currencies_repository.dart';
import 'package:first/data/source/currencies_source.dart';
import 'package:first/data/source/currency_hive_database.dart';
import 'package:first/data/source/firebase_source.dart';
import 'package:first/data/source/preferences_source.dart';
import 'package:meta/meta.dart';

part 'currencies_event.dart';
part 'currencies_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final CurrenciesRepository _currenciesRepository = CurrenciesRepository(
      CurrenciesSource(),
      PreferencesSource(),
      CurrencyHiveDatabase(),
      FirebaseSource());

  List<Currency> currencies = List.empty(growable: false);

  CurrenciesBloc() : super(CurrenciesInitial()) {
    on<GetCurrencyList>((event, emit) => _getCurrencyList(emit));

    add(GetCurrencyList());
  }
  void _getCurrencyList(Emitter<CurrenciesState> emit) async {
    emit(CurrenciesLoading());
    var currenciesData = await _currenciesRepository.getCurrenciesList();
    if (currenciesData.isSuccess()) {
      currencies = currenciesData.asSuccess().data;
      emit(CurrenciesSuccess(currencies));
    } else {
      emit(CurrenciesError(currenciesData.asError().errorMessage));
    }
  }
}
