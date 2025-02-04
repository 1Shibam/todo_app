import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/todos_model.dart';
import 'package:todo_app/providers/state%20provider/todo_state.dart';

import '../../../themes/themes_export.dart';

class UpdateTaskDetails extends ConsumerWidget {
  final String title;
  final String? desc;
  final String? startTime;
  final String? endTime;

  const UpdateTaskDetails({
    super.key,
    required this.title,
    this.desc,
    this.startTime,
    this.endTime,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Text editing controllers initialized with existing task values
    final TextEditingController titleController =
        TextEditingController(text: title);
    final TextEditingController descController =
        TextEditingController(text: desc);
    final TextEditingController startDateController =
        TextEditingController(text: startTime);
    final TextEditingController endDateController =
        TextEditingController(text: endTime);

    final formKey = GlobalKey<FormState>();

    // Method to select date
    Future<void> selectDate(
        BuildContext context, TextEditingController controller) async {
      DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100));
      if (picked != null) {
        controller.text = picked.toLocal().toString().split(' ')[0];
      }
    }

    return AlertDialog(
      title: const Text('Update Task'),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                style: AppTextStyles.normal(),
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Title cannot be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                style: AppTextStyles.normal(),
                maxLines: 3, // Allow the description to take up multiple lines
                keyboardType: TextInputType.multiline,

                controller: descController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  alignLabelWithHint: true,
                  hintStyle: AppTextStyles.normal(color: Colors.grey),
                  labelStyle: AppTextStyles.normal(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                style: AppTextStyles.normal(),
                controller: startDateController,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    hintStyle: AppTextStyles.normal(color: Colors.grey),
                    labelStyle: AppTextStyles.normal(color: Colors.grey),
                    labelText: 'Start Date',
                    suffixIcon: const Icon(Icons.calendar_today)),
                readOnly: true,
                onTap: () => selectDate(context, startDateController),
              ),
              const SizedBox(height: 16),
              TextFormField(
                style: AppTextStyles.normal(),
                controller: endDateController,
                decoration: const InputDecoration(
                    labelText: 'End Date',
                    suffixIcon: Icon(Icons.calendar_today)),
                readOnly: true,
                onTap: () => selectDate(context, endDateController),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              final updatedTask = TodosModel(
                todoTitle: titleController.text,
                todoDesc: descController.text,
                todoStartDate: startDateController.text,
                todoEndDate: endDateController.text,
              );
              ref.read(todoListProvider.notifier).updateTodo(updatedTask);
              Navigator.of(context).pop(); // Close the dialog after saving
            }
          },
          child: const Text('Save Changes'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
