import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/model/todos_model.dart';
import 'package:todo_app/providers/state%20provider/todo_state.dart';

import 'package:todo_app/themes/app_text_styles.dart';

class FloatingActionWidget extends ConsumerStatefulWidget {
  const FloatingActionWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FloatingActionWidgetState();
}

class _FloatingActionWidgetState extends ConsumerState<FloatingActionWidget> {
  //! required text editing controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  //! focus nodes for text form fields
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>(); //! form key for validation..

  @override
  //! getting dispose of controllers when not in use!!
  void dispose() {
    titleController.dispose();
    descController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  //!method for selecting dates

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        controller.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Enter Task Details',
                style: AppTextStyles.bold(),
              ),
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      style: AppTextStyles.normal(),
                      controller: titleController,
                      focusNode: titleFocusNode,
                      autofocus: true,
                      onFieldSubmitted: (value) {},
                      decoration: const InputDecoration(
                          labelText: 'Title', hintText: 'eg. cry more'),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Title cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      maxLines:
                          3, // Allow the description to take up multiple lines
                      keyboardType: TextInputType.multiline,
                      controller: descController,
                      focusNode: descFocusNode,
                      style: AppTextStyles.normal(),
                      autofocus: true,
                      onFieldSubmitted: (value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Task added to list',
                              style: AppTextStyles.normal(color: Colors.white)),
                          duration: const Duration(seconds: 1),
                        ));
                      },
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelText: 'Description',
                          hintText: 'lol lmao',
                          hintStyle: AppTextStyles.normal(color: Colors.grey),
                          labelStyle: AppTextStyles.normal(color: Colors.grey)),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: startDateController,
                      style: AppTextStyles.normal(),
                      decoration: InputDecoration(
                        hintStyle: AppTextStyles.normal(color: Colors.grey),
                        labelStyle: AppTextStyles.normal(color: Colors.grey),
                        labelText: 'Start Date',
                        hintText: 'Select start date',
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () => selectDate(context, startDateController),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: endDateController,
                      style: AppTextStyles.normal(),
                      decoration: InputDecoration(
                        hintStyle: AppTextStyles.normal(color: Colors.grey),
                        labelStyle: AppTextStyles.normal(color: Colors.grey),
                        labelText: 'End Date',
                        hintText: 'Select end date',
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () => selectDate(context, endDateController),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    // Clear the fields after submitting
                    titleController.clear();
                    descController.clear();
                    startDateController.clear();
                    endDateController.clear();

                    Navigator.pop(context); // Close the dialog without saving
                  },
                  child: Text(
                    'Cancel',
                    style:
                        AppTextStyles.normal(color: Colors.black, fontSize: 12),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final newTodo = TodosModel(
                              todoTitle: titleController.text,
                              todoDesc: descController.text,
                              todoStartDate: startDateController.text,
                              todoEndDate: endDateController.text);

                          ref.read(todoListProvider.notifier).addTodo(newTodo);

                          // Validate form

                          Navigator.pop(context);

                          // Clear the fields after submitting
                          titleController.clear();
                          descController.clear();
                          startDateController.clear();
                          endDateController.clear();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Task added to the database'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Submit',
                        style: AppTextStyles.normal(
                            color: Colors.black, fontSize: 12),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
      backgroundColor: Colors.grey,
      child: const Icon(
        Icons.add_task,
        size: 32,
      ),
    );
  }
}
