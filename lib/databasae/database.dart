// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


  final databaseProvider = Provider((ref) async {
    var dbPath = await getDatabasesPath();
    print('Database path: $dbPath'); // Debugging line
    String path = join(dbPath, 'task_database.db');



    //open the database
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
                        CREATE TABLE tasks (id INTEGER PRIMARY KEY AUTOINCREMENT, 
                        title TEXT NOT NULL, 
                        desc TEXT DEFAULT '',
                        isDone INTEGER NOT NULL DEFAULT 0, 
                        isDeleted INTEGER NOT NULL DEFAULT 0)
                        ''');
      },
    );
  });
