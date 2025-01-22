import 'package:flutter/material.dart';
import 'package:todo_app/models/data%20moodels/task_data_model.dart';
import 'package:todo_app/providers/provider_exports.dart';

import '../widgets_export.dart';

class EditTaskDialog extends ConsumerWidget {
  final TaskDataModel task;

  const EditTaskDialog({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return AlertDialog(
      title: Text(
        'Update Task details',
        style: AppTextStyles.bold(),
      ),
      content: const TextField(
        autofocus: true,

        decoration: InputDecoration(labelText: 'Task Title'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Same as submit button

            Navigator.pop(context); // Close the dialog and save
          },
          child: Text(
            'Cancel',
            style: AppTextStyles.normal(color: Colors.black, fontSize: 12),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Save the updated task



            Navigator.pop(context); // Close the dialog
          },
          child: Text(
            'Save',
            style: AppTextStyles.normal(color: Colors.black, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
