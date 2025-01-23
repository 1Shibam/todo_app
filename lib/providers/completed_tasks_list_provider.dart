// ignore_for_file: avoid_print

import 'package:todo_app/databasae/database.dart';
import 'package:todo_app/providers/provider_exports.dart';

final completedTasksListProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final db = await ref.read(databaseProvider);
  final tasks = await db.query('tasks'); // Get all tasks to inspect
  print('All tasks in DB: $tasks'); // Debugging output
  return tasks.where((task) => task['isDone'] == 1 && task['isDeleted'] == 0).toList();
});
