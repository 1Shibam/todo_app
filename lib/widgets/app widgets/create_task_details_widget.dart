import 'package:flutter/material.dart';
import 'package:todo_app/models/data%20moodels/task_data_model.dart';
import 'package:todo_app/providers/provider_exports.dart';
import 'package:todo_app/widgets/app%20widgets/custom_app_text_field.dart';

class CreateTaskDetailsWidget extends ConsumerWidget {
  const CreateTaskDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNameController = ref.watch(firstTextController);

    return AlertDialog(
      title: const Text('Enter Your Input'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField()
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog without saving
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Save input to the state
            ref.read(firstTextController.notifier).state = taskNameController;
            final newTask = TaskDataModel(title: taskNameController.text);
            ref.read(taskListProvider.notifier).addTask(newTask);

            Navigator.pop(context); // Close the dialog
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
