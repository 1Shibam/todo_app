// ignore_for_file: avoid_print

import 'package:todo_app/databasae/database.dart';
import 'package:todo_app/providers/provider_exports.dart';

final taskListProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final db = await ref.read(databaseProvider);
  final tasks = await db.query('tasks', where: 'isDeleted = ?', whereArgs: [0]);
  print('Fetched tasks: $tasks');
  return tasks;
});
