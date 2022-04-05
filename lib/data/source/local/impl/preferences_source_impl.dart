import 'package:first/data/source/local/preferences_source.dart';

class PreferencesSourceImpl extends PreferencesSource {
  @override
  Future<int?> getCurrencyTopId() async {
    var preferences = await getPreferences();
    return preferences.getInt(currencyTopId);
  }

  @override
  Future<int?> getCurrencyDownId() async {
    var preferences = await getPreferences();
    return preferences.getInt(currencyDownId);
  }

  @override
  Future<void> setCurrencyTopId(int id) async {
    var preferences = await getPreferences();
    preferences.setInt(currencyTopId, id);
  }

  @override
  Future<void> setCurrencyDownId(int id) async {
    var preferences = await getPreferences();
    preferences.setInt(currencyDownId, id);
  }

  @override
  Future<int?> getUpdateInterval() async {
    var preferences = await getPreferences();
    return preferences.getInt(updateInterval);
  }

  @override
  Future<int?> getUpdateTime() async {
    var preferences = await getPreferences();
    return preferences.getInt(updateTime);
  }

  @override
  Future<void> setUpdateInterval(int interval) async {
    var preferences = await getPreferences();
    preferences.setInt(updateInterval, interval);
  }

  @override
  Future<void> setUpdateTime(int time) async {
    var preferences = await getPreferences();
    preferences.setInt(updateTime, time);
  }
}
