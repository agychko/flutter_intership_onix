import 'package:shared_preferences/shared_preferences.dart';

class PreferencesSource {
  final String _currencyFromId = 'currency_from_id';
  final String _currencyToId = 'currency_to_id';

  Future<SharedPreferences> _getPreferences() async {
    return SharedPreferences.getInstance();
  }

  Future<int?> getCurrencyFromId() async {
    var preferences = await _getPreferences();
    return preferences.getInt(_currencyFromId);
  }

  Future<int?> getCurrencyToId() async {
    var preferences = await _getPreferences();
    return preferences.getInt(_currencyToId);
  }

  Future<void> setCurrencyFromId(int id) async {
    var preferences = await _getPreferences();
    preferences.setInt(_currencyFromId, id);
  }

  Future<void> setCurrencyToId(int id) async {
    var preferences = await _getPreferences();
    preferences.setInt(_currencyToId, id);
  }
}