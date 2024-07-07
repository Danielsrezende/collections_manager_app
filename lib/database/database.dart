import 'dart:async';
import 'package:collections_manager_app/database/migrations/collections_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CollectionsMangerDatabase {
  static final CollectionsMangerDatabase _instance =
    CollectionsMangerDatabase._internal();

  factory CollectionsMangerDatabase() => _instance;

  CollectionsMangerDatabase._internal();

  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await _initDb();
      return _db!;
    }
  }

  Future<bool> initialize() async {
    try {
      _db = await _initDb();
      return true;
    } catch (e) {
      print('Erro ao inicializar o banco de dados: $e');
      return false;
    }
  }

  Future<Database> _initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'collections.db');

    return await openDatabase(path, version: 1, onCreate: (
      Database db,
      int newerVersion,
    ) async {
      await _createTables(db);
    });
  }

  Future<void> _createTables(Database db) async {
    await createCollectionsTable(db);
  }
}
