import 'package:flutter/material.dart';
import 'package:todo_app/models/models_exports.dart';
import 'package:todo_app/providers/provider_exports.dart';
import '../widgets_export.dart';

class CreateTaskDetailsWidget extends ConsumerStatefulWidget {
  const CreateTaskDetailsWidget({super.key});

  @override
  ConsumerState<CreateTaskDetailsWidget> createState() =>
      _CreateTaskDetailsWidgetState();
}

class _CreateTaskDetailsWidgetState
    extends ConsumerState<CreateTaskDetailsWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController taskNameController;

  @override
  void initState() {
    super.initState();
    taskNameController = ref.read(firstTextController);
  }

  void _submitTask() {
    if (_formKey.currentState!.validate()) {
      final taskTitle = taskNameController.text.trim();

      // Save input to the state
      ref.read(taskListProvider.notifier).addTask(
            TaskDataModel(title: taskTitle),
          );

      Navigator.pop(context); // Close the dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Enter Task Details',
        style: AppTextStyles.bold(),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                style: AppTextStyles.normal(),
                autofocus: true,
                controller: taskNameController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'e.g. cry more',
                  errorStyle: TextStyle(color: Colors.red),
                ),
                validator: (value) {
                  final taskTitle = value?.trim() ?? '';

                  if (taskTitle.isEmpty) {
                    return 'Task title cannot be empty!';
                  }

                  final isDuplicateTitle = ref
                      .read(taskListProvider)
                      .any((task) => task.title == taskTitle);
                  if (isDuplicateTitle) {
                    return 'Task with this title already exists!';
                  }

                  return null; // No validation errors
                },
                onFieldSubmitted: (_)=> _submitTask(),
                ),
          ],
        ),
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
          onPressed: _submitTask,
          child: Text(
            'Submit',
            style: AppTextStyles.normal(color: Colors.black, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
