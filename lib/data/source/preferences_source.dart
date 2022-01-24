import 'package:shared_preferences/shared_preferences.dart';

class PreferencesSource {
  final String _currencyTopId = 'currency_top_id';
  final String _currencyDownId = 'currency_down_id';

  Future<SharedPreferences> _getPreferences() async {
    return SharedPreferences.getInstance();
  }

  Future<int?> getCurrencyTopId() async {
    var preferences = await _getPreferences();
    return preferences.getInt(_currencyTopId);
  }

  Future<int?> getCurrencyDownId() async {
    var preferences = await _getPreferences();
    return preferences.getInt(_currencyDownId);
  }

  Future<void> setCurrencyTopId(int id) async {
    var preferences = await _getPreferences();
    preferences.setInt(_currencyTopId, id);
  }

  Future<void> setCurrencyDownId(int id) async {
    var preferences = await _getPreferences();
    preferences.setInt(_currencyDownId, id);
  }
}