part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class GetUpdateInterval extends SettingsEvent{}

class UpdateTimeInterval extends SettingsEvent{
  final int interval;
  final int time;
  UpdateTimeInterval(this.interval,this.time);
}