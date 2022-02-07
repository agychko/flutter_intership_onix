import 'package:hive/hive.dart';

part 'currency_hive_model.g.dart';

@HiveType(typeId: 1)
class CurrencyHiveModel extends HiveObject{
  @HiveField(0)
  int id;

  @HiveField(1)
  String flag;

  @HiveField(2)
  String icon;

  @HiveField(3)
  String name;

  @HiveField(4)
  final String symbol;

  @HiveField(5)
  final double rate;

  CurrencyHiveModel(
      {required this.id,
        required this.flag,
        required this.icon,
        required this.name,
        required this.symbol,
        required this.rate});
}