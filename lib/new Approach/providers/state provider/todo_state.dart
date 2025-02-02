import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';
import 'package:todo_app/new%20Approach/repositories/todo_repository.dart';

final todoListProvider = StateNotifierProvider<TodoStateNotifier, List<TodosModel>>(
  (ref) => TodoStateNotifier(ref),
);

class TodoStateNotifier extends StateNotifier<List<TodosModel>> {
  final Ref ref;
  TodoStateNotifier(this.ref) : super([]) {
    loadTodos();
  } //!initial state

  Future<void> loadTodos() async {
    final todos = await ref.read(todoRepositoryProvider).fetchTodoList();
    state = todos;
  }

  Future<void> addTodo(TodosModel todo) async {
    await ref.read(todoRepositoryProvider).insertTodo(todo);
    loadTodos();
  }

  Future<void> toggleTodo(TodosModel todo) async{}
}
