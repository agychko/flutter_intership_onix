
import 'package:bloc/bloc.dart';
import 'package:first/data/source/preferences_source.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  final PreferencesSource _preferencesSource = PreferencesSource();
  int? updateInterval;

  SettingsBloc() : super(SettingsInitial()) {
    on<GetUpdateInterval>((event, emit) => _getUpdateInterval(emit));
    on<UpdateTimeInterval>((event, emit) => _updateTimeInterval(event, emit));

    add(GetUpdateInterval());
  }

  void _getUpdateInterval(Emitter <SettingsState> emit) async{
    emit(SettingsInitial());
    var interval = await _preferencesSource.getUpdateInterval()??15;
    updateInterval=interval.toInt();
  }

  void _updateTimeInterval(UpdateTimeInterval event, Emitter<SettingsState> emit) async {
    await _preferencesSource.setUpdateInterval(event.interval);
    await _preferencesSource.setUpdateTime(event.time);
  }

}
