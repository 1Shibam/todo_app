// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:todo_app/databasae/database.dart';
import 'package:todo_app/providers/provider_exports.dart';

//insert a task to database--

Future<void> insertTask(WidgetRef ref, String taskTitle,
    {String description = ''}) async {
  final db = await ref.read(databaseProvider);
  await db.insert('tasks',
      {'title': taskTitle, 'desc': description, 'isDone': 0, 'isDeleted': 0},
      conflictAlgorithm: ConflictAlgorithm.replace);

      //checking if the method is running or not
  print(
      'data Inserted : $taskTitle is the title and $description is the description added!!');
}

//Fetching data from the Data base--
Future<List<Map<String, dynamic>>> getTasks(WidgetRef ref) async {
  final db = await ref.read(databaseProvider);
  return await db.query('tasks', where: 'isDeleted = ?', whereArgs: [0]);
}
