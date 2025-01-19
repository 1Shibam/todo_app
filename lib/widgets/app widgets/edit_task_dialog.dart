import 'package:flutter/material.dart';
import 'package:todo_app/models/data%20moodels/task_data_model.dart';
import 'package:todo_app/providers/provider_exports.dart';

import '../widgets_export.dart';

class EditTaskDialog extends ConsumerWidget {
  final TaskDataModel task;

  const EditTaskDialog({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller =
        TextEditingController(text: task.title);

    return AlertDialog(
      title: Text(
        'Edit Task',
        style: AppTextStyles.bold(),
      ),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(labelText: 'Task Title'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Same as submit button
            final updatedTask = task.copyWith(title: controller.text);
            ref.read(taskListProvider.notifier).updateTask(task.title, updatedTask);
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
            final updatedTask = task.copyWith(title: controller.text);

            // Use Riverpod to update the state
            ref.read(taskListProvider.notifier).updateTask(task.title, updatedTask);

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
