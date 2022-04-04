import 'package:first/data/repository/currencies_repository_impl.dart';
import 'package:first/data/source/local/currency_hive_database.dart';
import 'package:first/data/source/local/impl/currency_hive_database_impl.dart';
import 'package:first/data/source/local/impl/preferences_source_impl.dart';
import 'package:first/data/source/local/preferences_source.dart';
import 'package:first/data/source/remote/currencies_source.dart';
import 'package:first/data/source/remote/firebase_source.dart';
import 'package:first/data/source/remote/impl/currencies_source_impl.dart';
import 'package:first/data/source/remote/impl/firebase_source_impl.dart';
import 'package:first/domain/repository/currencies_repository.dart';
import 'package:first/domain/usecase/get_converter_data_use_case.dart';
import 'package:first/domain/usecase/get_currencies_list_use_case.dart';
import 'package:first/domain/usecase/update_selected_currencies_use_case.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<CurrenciesSource>(CurrenciesSourceImpl());
  getIt.registerSingleton<PreferencesSource>(PreferencesSourceImpl());
  getIt.registerSingleton<CurrencyHiveDatabase>(CurrencyHiveDatabaseImpl());
  getIt.registerSingleton<FirebaseSource>(FirebaseSourceImpl());

  getIt.registerLazySingleton<CurrenciesRepository>(
      () => CurrenciesRepositoryImpl(
            getIt<CurrenciesSource>(),
            getIt<PreferencesSource>(),
            getIt<CurrencyHiveDatabase>(),
            getIt<FirebaseSource>(),
          ));

  getIt.registerLazySingleton<GetConverterDataUseCase>(
      () => GetConverterDataUseCase(getIt<CurrenciesRepository>()));

  getIt.registerLazySingleton<GetCurrenciesListUseCase>(
      () => GetCurrenciesListUseCase(getIt<CurrenciesRepository>()));

  getIt.registerLazySingleton<UpdateSelectedCurrenciesUseCase>(
      () => UpdateSelectedCurrenciesUseCase(getIt<CurrenciesRepository>()));
}
