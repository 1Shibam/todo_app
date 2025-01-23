// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:todo_app/databasae/database.dart';
import 'package:todo_app/providers/provider_exports.dart';
import 'package:todo_app/providers/quote_provider/task_list_provider.dart';

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

//toggling task completion status
Future<void> toggleTaskStatus(WidgetRef ref, int taskId) async {
  final db = await ref.read(databaseProvider);
  final task = await db.query('tasks', where: 'id = ?', whereArgs: [taskId]);
  if (task.isEmpty) {
    return;
  }
  final isDone = task[0]['isDone'] == 1 ? 0 : 1;
  await db.update('tasks', {'isDone': isDone},
      where: 'id = ?', whereArgs: [taskId]);

  ref.invalidate(taskListProvider);
}

//updating task
Future<void> updateTask(WidgetRef ref, int taskId, String newTitle, {String newDescription = ''}) async {
  final db = await ref.read(databaseProvider);

  await db.update(
    'tasks',
    {
      'title': newTitle,
      'desc': newDescription,
    },
    where: 'id = ?',
    whereArgs: [taskId],
  );

  // After updating, invalidate the task list to refresh the UI
  ref.invalidate(taskListProvider);
}

