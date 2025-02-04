import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';
import 'package:todo_app/new%20Approach/repositories/todo_repository.dart';

final deletedTodoListProvider =
    StateNotifierProvider<TodoDeletedStateNotifier, List<TodosModel>>(
        (ref) => TodoDeletedStateNotifier(ref));

class TodoDeletedStateNotifier extends StateNotifier<List<TodosModel>> {
  final Ref ref;
  TodoDeletedStateNotifier(this.ref) : super([]);

  Future<void> loadTemporaryDeletedTodos() async {
    final tempDeletedTodos =
        await ref.read(todoRepositoryProvider).fetchTemporaryDeletedTodos();
    state = tempDeletedTodos;
  }
  
}
