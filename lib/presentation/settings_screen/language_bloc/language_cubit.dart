import 'package:bloc/bloc.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState(code: 'en'));

  void changeLanguage(String code) {
    emit(LanguageState(code: code));
  }
}
