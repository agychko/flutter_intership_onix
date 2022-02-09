
import 'package:first/data/source/preferences_source.dart';
import 'package:flutter/material.dart';

class SettingsScreenProvider extends ChangeNotifier {
  final PreferencesSource _preferencesSource = PreferencesSource();
  late int updateInterval;

  SettingsScreenProvider(){
    getUpdateInterval();
  }

  void getUpdateInterval() async{
    notifyListeners();
    var interval = await _preferencesSource.getUpdateInterval()??15;
    updateInterval=interval.toInt();
    notifyListeners();
  }

  void updateTimeInterval(int interval, int time) async {
    await _preferencesSource.setUpdateInterval(interval);
    await _preferencesSource.setUpdateTime(time);
    notifyListeners();
  }

}