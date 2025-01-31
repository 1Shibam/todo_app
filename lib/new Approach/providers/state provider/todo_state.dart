import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';
import 'package:todo_app/new%20Approach/repositories/todo_repository.dart';

class TodoStateNotifier extends StateNotifier<List<TodosModel>> {
  final Ref ref;
  TodoStateNotifier(this.ref) : super([]) {
    loadTodos();
  } //!initial state

  Future<void> loadTodos() async {
    final todos = await ref.read(todoRepositoryProvider).fetchTodoList();
    state = todos;
  }
}
