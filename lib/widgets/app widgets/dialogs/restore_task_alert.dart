import 'package:flutter/material.dart';
import 'package:todo_app/databasae/database_methods.dart';
import 'package:todo_app/providers/data%20providers/provider_exports.dart';
import 'package:todo_app/widgets/widgets_export.dart';

class RestoreTaskAlert extends ConsumerWidget {
  const RestoreTaskAlert({
    super.key,
    required this.task,
  });

  final Map<String, dynamic> task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('Restore Task!?', style: AppTextStyles.bold()),
      content: RichText(
          text: TextSpan(
              text: 'Are you sure you want to restore ',
              style: AppTextStyles.normal(),
              children: [
            TextSpan(
                text: '${task['title'].toString().split(' ').first}...',
                style: AppTextStyles.normal(color: Colors.green).copyWith(
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
              restoreTask(ref, task['id']);
              Navigator.pop(context);
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
