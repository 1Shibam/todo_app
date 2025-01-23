import 'package:flutter/material.dart';
import 'package:todo_app/databasae/database_methods.dart';
import 'package:todo_app/providers/provider_exports.dart';
import 'package:todo_app/widgets/widgets_export.dart';

class DeleteTaskAlert extends ConsumerWidget {
  const DeleteTaskAlert({
    super.key,
    required this.task,
  });

  final Map<String, dynamic> task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('Delete Task!?', style: AppTextStyles.bold()),
      content: Text(
        'Are you sure you want to delete ${task['title'].toString().split(' ').first}...?',
        style: AppTextStyles.normal(),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel', style: AppTextStyles.normal())),
        TextButton(
            onPressed: () {
              softDeleteTask(ref, task['id']);
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
