
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path_provider/path_provider.dart';

//! This is the database provider
final databaseProvider = FutureProvider<Database>((ref) async {
  
  final dbPath = await getApplicationDocumentsDirectory();
  final pathDirectory = join(dbPath.path, 'todos.db');

  return openDatabase(
    pathDirectory,
    version: 2,
    onCreate: (db, version) {
      return db.execute('''
      CREATE TABLE todoTable(
      todoID INTEGER PRIMARY KEY AUTOINCREMENT,
      todoTitle TEXT NOT NULL,
      todoDesc TEXT,
      todoStartDate TEXT,
      todoEndDate TEXT,
      todoCompleted INTEGER DEFAULT 0,
      todoDeleted INTEGER DEFAULT 0
      )''');
    },
  );
});
