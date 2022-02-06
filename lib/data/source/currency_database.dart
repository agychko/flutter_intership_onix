
import 'package:first/data/model/currency_db_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSource {
  final String _databaseName = 'currency_app_database';
  final int _databaseVersion = 1;

  //table
  final String _tableName = 'currencies';
  static const String id = 'id';
  static const String flag = 'flag';
  static const String icon = 'icon';
  static const String name = 'name';
  static const String symbol = 'symbol';
  static const String rate = 'rate';

  Database? _database;

  Future<Database> _getDatabase() {
    if (_database != null) {
      return Future.value(_database);
    } else {
      return _initDatabase();
    }
  }

  Future<Database> _initDatabase() async {
    var documentsDirectory = await getDatabasesPath();
    var path = join(documentsDirectory, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_tableName (
            $id INTEGER PRIMARY KEY,
            $flag TEXT NOT NULL,
            $icon TEXT NOT NULL,
            $name TEXT NOT NULL,
            $symbol TEXT NOT NULL,
            $rate REAL NOT NULL
          )
          ''');
  }

  Future<void> saveCurrencies(List<CurrencyDbModel> currencies) async {
    var db = await _getDatabase();
    for (int i = 0; i < currencies.length; i++) {
      await db.insert(_tableName, currencies[i].toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<List<CurrencyDbModel>> getCurrencies() async {
    var db = await _getDatabase();
    List<Map<String, dynamic>> table = await db.query(_tableName);
    return table.map((item) => CurrencyDbModel.fromMap(item)).toList();
  }

  Future<CurrencyDbModel> getCurrencyForId(int currencyId) async {
    var db = await _getDatabase();
    List<Map<String, dynamic>> table =
    await db.query(_tableName,

        where: '$id = ?', whereArgs: [currencyId]);
    if (table.isNotEmpty) {
      return CurrencyDbModel.fromMap(table[0]);
    } else {
      return CurrencyDbModel.empty();
    }
  }
}