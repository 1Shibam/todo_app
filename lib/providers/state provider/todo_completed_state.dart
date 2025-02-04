import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app/model/todos_model.dart';

import '../../repositories/todo_repository.dart';

final completedTodosListProvider =
    StateNotifierProvider<TodoCompletedStateNotifier, List<TodosModel>>(
        (ref) => TodoCompletedStateNotifier(ref));

class TodoCompletedStateNotifier extends StateNotifier<List<TodosModel>> {
  final Ref ref;

  TodoCompletedStateNotifier(this.ref) : super([]) {
    loadCompletedTodos();
  }
  //! Load completed Todos from the database
  Future<void> loadCompletedTodos() async {
    final completeTodos =
        await ref.read(todoRepositoryProvider).fetchOnlyCompletedList();
    state = completeTodos;
  }
}
