import 'package:flutter/material.dart';
import 'my_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/model/currency_hive_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeDatabase();
  runApp(const MyApp());
}

Future<void> _initializeDatabase() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CurrencyHiveModelAdapter());
}