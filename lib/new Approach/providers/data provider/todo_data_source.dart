import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/new%20Approach/database/database_provider.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';

class TodoDataSource {
  // Instance of database
  final Database database;

  TodoDataSource(this.database);

  //! Add Todo
  Future<int> createTodo(TodosModel todo) async {
    return await database.insert('todoTable', todo.toMap());
  }

  //! Get Todos List
  Future<List<TodosModel>> getTodosList() async {
    final maps = await database.query('todoTable');
    return maps.map((data) => TodosModel.fromMap(data)).toList();
  }

  //! Update Todo Details
  Future<int> updateTodo(TodosModel todo) async {
    return await database.update(
      'todoTable',
      {
        'todoTitle': todo.todoTitle,
        'todoDescription': todo.todoDesc,
        'startTime': todo.todoStartDate,
        'endTime': todo.todoEndDate,
      },
      where: 'todoID = ?',
      whereArgs: [todo.todoID],
    );
  }

  //! Toggle Completion Status
  Future<int> updateCompletionStatus(int id, bool isCompleted) async {
    return await database.update(
      'todoTable',
      {'todoCompleted': isCompleted ? 1 : 0},
      where: 'todoID = ?',
      whereArgs: [id],
    );
  }

  //! Soft Delete Todo (Restorable)
  Future<int> softDeleteTodo(int id) async {
    return await database.update('todoTable', {'todoDeleted': 1}, where: 'todoID = ?', whereArgs: [id]);
  }

  //! Restore Soft-Deleted Todo
  Future<int> restoreTodo(int id) async {
    return await database.update('todoTable', {'todoDeleted': 0}, where: 'todoID = ?', whereArgs: [id]);
  }

  //! Permanent Delete Todo
  Future<int> deleteTodo(int id) async {
    return await database.delete('todoTable', where: 'todoID = ?', whereArgs: [id]);
  }
}

final todoDataSourceProvider = Provider<TodoDataSource>((ref) {
  final databaseAsync = ref.watch(databaseProvider);

  return databaseAsync.when(
    data: (data) => TodoDataSource(data),
    error: (err, stackTrace) => throw Exception('Error loading database: $err'),
    loading: () => throw Exception('Database still loading!'),
  );
});
