import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:wordpath/model/WordPair.dart';

class DatabaseHelper {
  static Database? _database;
  static const String _dbName = 'word_pairs.db';
  static const String _tableName = 'word_pairs';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        english TEXT,
        turkish TEXT
      )
    ''');
  }

  Future<int> insertWordPair(WordPair wordPair) async {
    Database db = await instance.database;
    return await db.insert(_tableName, wordPair.toMap());
  }

  Future<List<WordPair>> getAllWordPairs() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(_tableName);
    return List.generate(maps.length, (i) {
      return WordPair.fromMap(maps[i]);
    });
  }

  queryAllWordPairs() {}
}
