import 'package:flutter/material.dart';
import 'my_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/model/local/currency_hive_model.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeDatabase();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpServiceLocator();
  runApp(const MyApp());
}

Future<void> _initializeDatabase() async {
  await Hive.initFlutter();

  Hive.registerAdapter(CurrencyHiveModelAdapter());
}
