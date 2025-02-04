import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';
import 'package:todo_app/new%20Approach/providers/state%20provider/todo_deleted_state.dart';
import 'package:todo_app/new%20Approach/repositories/todo_repository.dart';

import 'todo_completed_state.dart';

//! this is the state provider!!
final todoListProvider =
    StateNotifierProvider<TodoStateNotifier, List<TodosModel>>((ref) {
  return TodoStateNotifier(ref);
});

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
    // Trigger reload for completed todos after updating the status
    ref.read(completedTodosListProvider.notifier).loadCompletedTodos();
    loadTodos();
  }

  //! Soft delete a todo (Restorable)
  Future<void> tempDeleteTodo(int id) async {
    await ref.read(todoRepositoryProvider).softDeleteTodo(id);
    //trigger reload for deleted list
    print('reload of deleted list has been triggered!');
    ref.read(completedTodosListProvider.notifier).loadCompletedTodos();
    ref.read(deletedTodoListProvider.notifier).loadTemporaryDeletedTodos();

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
    ref.read(completedTodosListProvider.notifier).loadCompletedTodos();
    ref.read(deletedTodoListProvider.notifier).loadTemporaryDeletedTodos();
    loadTodos();
  }

  Future<void> destroyAllTodo() async {
    await ref.read(todoRepositoryProvider).permanentlyDestroyAllTodo();
    ref.read(completedTodosListProvider.notifier).loadCompletedTodos();
    ref.read(deletedTodoListProvider.notifier).loadTemporaryDeletedTodos();
  }
}
