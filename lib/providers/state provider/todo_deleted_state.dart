import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/todos_model.dart';
import 'package:todo_app/repositories/todo_repository.dart';

final deletedTodoListProvider =
    StateNotifierProvider<TodoDeletedStateNotifier, List<TodosModel>>(
        (ref) => TodoDeletedStateNotifier(ref));

class TodoDeletedStateNotifier extends StateNotifier<List<TodosModel>> {
  final Ref ref;
  TodoDeletedStateNotifier(this.ref) : super([]) {
    loadTemporaryDeletedTodos();
  }

  Future<void> loadTemporaryDeletedTodos() async {
    // print('this got triggered!!!');
    final tempDeletedTodos =
        await ref.read(todoRepositoryProvider).fetchTemporaryDeletedTodos();
    state = tempDeletedTodos;
  }
}
