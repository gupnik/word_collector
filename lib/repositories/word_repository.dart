import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:word_collector/models/word.dart';

class WCWordRepository {
  static final WCWordRepository _repository = WCWordRepository._internal();

  factory WCWordRepository() {
    return _repository;
  }

  WCWordRepository._internal() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Database _db;

  get _database async {
    _db = _db ??
        await openDatabase(
          join(await getDatabasesPath(), 'word_database.db'),
          onCreate: (db, version) {
            return db.execute(
              'CREATE TABLE words(id INTEGER PRIMARY KEY autoincrement, name TEXT, meaning TEXT)',
            );
          },
          version: 1,
        );
    return _db;
  }

  Future<List<WCWord>> words() async {
    final db = await _database;

    final List<Map<String, dynamic>> maps = await db.query('words');

    return List.generate(maps.length, (i) {
      return WCWord(maps[i]['name'],
          id: maps[i]['id'], meaning: maps[i]['meaning']);
    });
  }

  Future<void> insertWord(WCWord word) async {
    final db = await _database;
    await db.insert(
      'words',
      word.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateWord(WCWord word) async {
    final db = await _database;

    await db.update(
      'words',
      word.toMap(),
      where: 'id = ?',
      whereArgs: [word.id],
    );
  }

  Future<void> deleteWord(int id) async {
    final db = await _database;

    await db.delete(
      'words',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
