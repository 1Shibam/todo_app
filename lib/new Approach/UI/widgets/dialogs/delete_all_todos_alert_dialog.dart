import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/providers/state%20provider/todo_state.dart';
import 'package:todo_app/new%20Approach/themes/app_text_styles.dart';

class DeleteAllTodosAlertDialog extends ConsumerWidget {
  const DeleteAllTodosAlertDialog({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('Delete Task!?', style: AppTextStyles.bold()),
      content: Text(
        'Are you sure you want to all the tasks permanently!?',
        style: AppTextStyles.normal(color: Colors.red),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel', style: AppTextStyles.normal())),
        TextButton(
            onPressed: () {
              ref.read(todoListProvider.notifier).destroyAllTodo();
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(4)),
              child: Text('Delete', style: AppTextStyles.normal()),
            ))
      ],
    );
  }
}
