import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/state%20provider/todo_state.dart';
import 'package:todo_app/themes/app_text_styles.dart';

class RestoreTaskDialog extends ConsumerWidget {
  const RestoreTaskDialog({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('Restore Task!?', style: AppTextStyles.bold()),
      content: RichText(
          text: TextSpan(
              text: 'Are you sure you want to restore',
              style: AppTextStyles.normal(),
              children: [
            TextSpan(
                text: '.',
                style: AppTextStyles.normal(color: Colors.red).copyWith(
                    decoration: TextDecoration.underline,
                    decorationThickness: 3))
          ])),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel', style: AppTextStyles.normal())),
        TextButton(
            onPressed: () {
              ref.read(todoListProvider.notifier).restoreTodo(id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Task restored Successfully!!',
                  style: AppTextStyles.normal(),
                ),
                duration: const Duration(seconds: 2),
                backgroundColor: Colors.green,
              ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(4)),
              child: Text('Restore', style: AppTextStyles.normal()),
            ))
      ],
    );
  }
}
