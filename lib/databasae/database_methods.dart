//insert a task to database

import 'package:sqflite/sqflite.dart';
import 'package:todo_app/databasae/database.dart';
import 'package:todo_app/providers/provider_exports.dart';

Future<void> insertTask(WidgetRef ref, String taskTitle,
    {String description = ''}) async {
  final db = await ref.read(databaseProvider);
  await db.insert('tasks',
      {'title': taskTitle, 'desc': description, 'isDone': 0, 'isDeleted': 0},
      conflictAlgorithm: ConflictAlgorithm.replace);
}
