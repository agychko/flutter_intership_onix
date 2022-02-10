
import 'package:first/data/source/currency_database.dart';

class CurrencyDbModel {
  final int id;
  final String flag;
  final String icon;
  final String name;
  final String symbol;
  final double rate;

  CurrencyDbModel(
  { required this.id,
    required this.flag,
    required this.icon,
    required this.name,
    required this.symbol,
    required this.rate});

  static CurrencyDbModel empty() => CurrencyDbModel (
    id: -1,
    flag: '',
    icon: '',
    name: '',
    symbol: '',
    rate: 0.00,
  );

  static CurrencyDbModel fromMap(Map<String, dynamic> data) => CurrencyDbModel(
    id: data[DatabaseSource.id] as int,
    flag: data[DatabaseSource.flag] as String,
    icon: data[DatabaseSource.icon] as String,
    name: data[DatabaseSource.name] as String,
    symbol: data[DatabaseSource.symbol] as String,
    rate: data[DatabaseSource.rate] as double,
  );

  Map<String, dynamic> toMap() => <String, dynamic>{
    DatabaseSource.id: id,
    DatabaseSource.flag: flag,
    DatabaseSource.icon: icon,
    DatabaseSource.name: name,
    DatabaseSource.symbol: symbol,
    DatabaseSource.rate: rate,
  };
}