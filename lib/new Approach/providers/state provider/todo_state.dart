import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';
import 'package:todo_app/new%20Approach/repositories/todo_repository.dart';

//! this is the state provider!!
final todoListProvider =
    StateNotifierProvider<TodoStateNotifier, List<TodosModel>>(
  (ref) => TodoStateNotifier(ref),
);

class TodoStateNotifier extends StateNotifier<List<TodosModel>> {
  final Ref ref;

  TodoStateNotifier(this.ref) : super([]) {
    loadTodos();
  }

  //! Load todos from the database
  Future<void> loadTodos() async {
    final todos = await ref.read(todoRepositoryProvider).fetchTodoList();
    state = todos;
  }

  //! Load completed Todos from the database
  Future<void> loadCompletedTodos() async {
    final completeTodos =
        await ref.read(todoRepositoryProvider).fetchOnlyCompletedList();
    state = completeTodos;
  }

  //! Load Temporary deleted Todos from the database
  Future<void> loadTemporaryDeletedTodos() async {
    final tempDeletedTodos =
        await ref.read(todoRepositoryProvider).fetchTemporaryDeletedTodos();
    state = tempDeletedTodos;
  }

  //! Add a new todo
  Future<void> addTodo(TodosModel todo) async {
    await ref.read(todoRepositoryProvider).insertTodo(todo);
    loadTodos();
  }

  //! Update an existing todo
  Future<void> updateTodo(TodosModel updatedTodo) async {
    await ref.read(todoRepositoryProvider).updateTodo(updatedTodo);
    loadTodos();
  }

  //! Toggle completion status
  Future<void> toggleCompletion(TodosModel todo) async {
    final newStatus = !todo.todoCompleted;
    await ref
        .read(todoRepositoryProvider)
        .toggleCompletion(todo.todoID!, newStatus);
    loadTodos();
  }

  //! Soft delete a todo (Restorable)
  Future<void> tempDeleteTodo(int id) async {
    await ref.read(todoRepositoryProvider).softDeleteTodo(id);
    loadTodos();
  }

  //! Restore a soft-deleted todo
  Future<void> restoreTodo(int id) async {
    await ref.read(todoRepositoryProvider).restoreTodo(id);
    loadTodos();
  }

  //! Permanently delete a todo
  Future<void> deleteTodo(int id) async {
    await ref.read(todoRepositoryProvider).deleteTodo(id);
    loadTodos();
  }
}
