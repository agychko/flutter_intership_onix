import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PreferencesSource {
  @protected
  final String currencyTopId = 'currency_top_id';
  @protected
  final String currencyDownId = 'currency_down_id';
  @protected
  final String updateInterval = 'update_interval';
  @protected
  final String updateTime = 'update_time';

  @protected
  Future<SharedPreferences> getPreferences() async {
    return SharedPreferences.getInstance();
  }

  Future<int?> getCurrencyTopId();

  Future<int?> getCurrencyDownId();

  Future<void> setCurrencyTopId(int id);

  Future<void> setCurrencyDownId(int id);

  Future<int?> getUpdateInterval();

  Future<int?> getUpdateTime();

  Future<void> setUpdateInterval(int interval);

  Future<void> setUpdateTime(int time);
}
