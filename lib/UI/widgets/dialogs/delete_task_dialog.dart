import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/state%20provider/todo_state.dart';
import 'package:todo_app/themes/app_text_styles.dart';

class DeleteTaskDialog extends ConsumerWidget {
  const DeleteTaskDialog({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('Delete Task!?', style: AppTextStyles.bold()),
      content: Text(
        'Are you sure you want to move this to recycle bin!!?',
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
              ref.read(todoListProvider.notifier).tempDeleteTodo(id);
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
