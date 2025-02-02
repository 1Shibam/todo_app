import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/app%20widgets/others/app_text_styles.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';

import '../providers/state provider/todo_state.dart';

class TodoTile extends ConsumerWidget {
  final TodosModel todosModel;
  const TodoTile({super.key, required this.todosModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(
        todosModel.todoTitle,
        style: AppTextStyles.bold(),
      ),
      subtitle: Text(todosModel.todoDesc ?? ''),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        Checkbox(value: todosModel.todoCompleted, onChanged:  (_) => ref.read(todoListProvider.notifier).toggleTodo(todosModel))
      ,IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => ref.read(todoListProvider.notifier).deleteTodo(todosModel.todoID!),
          ),
      ],),
    );
  }
}
