import 'package:flutter/material.dart';
import 'package:todo_app/models/models_exports.dart';
import 'package:todo_app/providers/provider_exports.dart';
import '../widgets_export.dart';

class CreateTaskDetailsWidget extends ConsumerWidget {
  const CreateTaskDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNameController = ref.watch(firstTextController);

    return AlertDialog(
      title: Text(
        'Enter Your Input',
        style: AppTextStyles.bold(),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            style: AppTextStyles.normal(),
            autofocus: true,
            controller: taskNameController,
            onSubmitted: (_) {
              //same as submit button
              ref.read(firstTextController.notifier).state = taskNameController;
              final newTask = TaskDataModel(title: taskNameController.text);
              ref.read(taskListProvider.notifier).addTask(newTask);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                labelText: 'Title', hintText: 'eg. cry more'),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog without saving
          },
          child: Text(
            'Cancel',
            style: AppTextStyles.normal(color: Colors.black, fontSize: 12),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Save input to the state
            ref.read(firstTextController.notifier).state = taskNameController;
            final newTask = TaskDataModel(title: taskNameController.text);
            ref.read(taskListProvider.notifier).addTask(newTask);

            Navigator.pop(context); // Close the dialog
          },
          child: Text(
            'Submit',
            style: AppTextStyles.normal(color: Colors.black, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
