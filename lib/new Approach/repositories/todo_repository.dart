import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';
import 'package:todo_app/new%20Approach/providers/data%20provider/todo_data_source.dart';

//! This is the todo repository!!
class TodoRepository {
  final TodoDataSource dataSource;
  TodoRepository(this.dataSource);

  //! Fetch all todos
  Future<List<TodosModel>> fetchTodoList() => dataSource.getTodosList();

  //! Fetch Only Completed Todos
  Future<List<TodosModel>> fetchOnlyCompletedList() =>
      dataSource.getCompletedTodosList();

  //! Fetch Soft Deleted Todos

  Future<List<TodosModel>> fetchTemporaryDeletedTodos() =>
      dataSource.getSoftDeletedTodosList();

  //! Add a new todo
  Future<int> insertTodo(TodosModel todo) => dataSource.createTodo(todo);

  //! Update an existing todo
  Future<int> updateTodo(TodosModel todo) => dataSource.updateTodo(todo);

  //! Toggle completion status
  Future<int> toggleCompletion(int id, bool isCompleted) =>
      dataSource.updateCompletionStatus(id, isCompleted);

  //! Soft delete a todo (restorable)
  Future<int> softDeleteTodo(int id) => dataSource.softDeleteTheTodo(id);

  //! Restore a soft-deleted todo
  Future<int> restoreTodo(int id) => dataSource.restoreTodo(id);

  //! Permanently delete a todo
  Future<int> deleteTodo(int id) => dataSource.deleteTodo(id);
}

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final source = ref.watch(todoDataSourceProvider);
  return TodoRepository(source);
});
