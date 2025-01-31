import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';
import 'package:todo_app/new%20Approach/providers/data%20provider/todo_data_source.dart';

class TodoRepository {
  final TodoDataSource dataSource;
  TodoRepository(this.dataSource);

  Future<List<TodosModel>> fetchTodoList() => dataSource.getTodosList();
  Future<int> insertTodo(TodosModel todo) => dataSource.createTodo(todo);
  Future<int> updateTodo(TodosModel todo) => dataSource.updateTodo(todo);
  Future<int> setComplete(int id) => dataSource.markCompleted(id);
  Future<int> setUncomplete(int id) => dataSource.markNotCompleted(id);
  Future<int> temporaryDeletion(int id) => dataSource.softDeleteTodo(id);
  Future<int> restoreDeleted(int id) => dataSource.restoreTodo(id);
  Future<int> deleteTodo(int id) => dataSource.deleteTodo(id);
}

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final source = ref.watch(todoDataSourceProvider);
  return TodoRepository(source);
});
