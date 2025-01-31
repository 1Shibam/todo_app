import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/new%20Approach/database/database_provider.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';

class TodoDataSource {
  //instance of database
  final Database database;

  TodoDataSource(this.database);

  //! Todo creation

  Future<int> createTodo(TodosModel todo) async {
    return await database.insert('todoTable', todo.toMap());
  }

  //! get todo list

  Future<List<TodosModel>> getTodosList() async {
    final maps = await database.query('todoTable', );
    return maps.map((data) => TodosModel.fromMap(data)).toList();
  }

  //! update a todo

  Future<int> updateTodo(TodosModel todo) async {
    return await database.update('todoTable', todo.toMap(),
        where: 'todoID = ?', whereArgs: [todo.todoID]);
  }
  //! Mark todo as completed
  Future<int> markCompleted(int id) async {
    return await database.update('todoTable', {'todoCompleted': 1},
        where: 'todoID = ?', whereArgs: [id]);
  }

  //! Mark todo as not completed
  Future<int> markNotCompleted(int id) async {
    return await database.update('todoTable', {'todoCompleted': 0},
        where: 'todoID = ?', whereArgs: [id]);
  }

  //! soft delete a todo(restorable!)
  Future<int> softDeleteTodo(int id) async {
    return await database.update('todoTable', {'todoDeleted': 1}, where: 'todoID = ?', whereArgs: [id]);
  }

  //! Restore a soft-deleted todo
  Future<int> restoreTodo(int id) async {
    return await database.update('todoTable', {'todoDeleted': 0},
        where: 'todoID = ?', whereArgs: [id]);
  }

  //! delete a todo

  Future<int> deleteTodo(int id) async {
    return await database
        .delete('todoTable', where: 'todoID = ?', whereArgs: [id]);
  }
}

final todoDataSourceProvider = Provider<TodoDataSource>((ref) {
  // Watch the database provider (which returns Future<Database>)
  final databaseAsync = ref.watch(databaseProvider);

  // Use `.when` to handle the AsyncValue properly
  return databaseAsync.when(
      data: (data) {
        return TodoDataSource(data);
      },
      error: (err, stackTrace) =>
          throw Exception('Error loading database : $err'),
      loading: () => throw Exception('database still loading!!'));
});
