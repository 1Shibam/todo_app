import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/app%20widgets/others/app_text_styles.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';

class TodoTile extends ConsumerWidget {
  final TodosModel todosModel;
  const TodoTile({super.key, required this.todosModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(todosModel.todoTitle, style: AppTextStyles.bold(),),
    );
  }
}
