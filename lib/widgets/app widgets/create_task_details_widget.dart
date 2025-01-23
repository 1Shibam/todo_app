import 'package:flutter/material.dart';
import 'package:todo_app/databasae/database_methods.dart';
import 'package:todo_app/providers/provider_exports.dart';
import 'package:todo_app/providers/task_list_provider.dart';
import '../widgets_export.dart';

//Text controllers
final titleTextControllerProvider = AutoDisposeProvider<TextEditingController>(
    (ref) => TextEditingController());
final descTextControllerProvider = AutoDisposeProvider<TextEditingController>(
    (ref) => TextEditingController());

//Focus Nodes

final titleFocusNodeProvider =
    AutoDisposeProvider<FocusNode>((ref) => FocusNode());
final descFocusNondeProvider =
    AutoDisposeProvider<FocusNode>((ref) => FocusNode());

class CreateTaskDetailsWidget extends ConsumerWidget {
  const CreateTaskDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = ref.watch(titleTextControllerProvider);
    final descController = ref.watch(descTextControllerProvider);
    final titleFocusNode = ref.watch(titleFocusNodeProvider);
    final descFocusNode = ref.watch(descFocusNondeProvider);
    return AlertDialog(
      title: Text(
        'Enter Task Details',
        style: AppTextStyles.bold(),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            style: AppTextStyles.normal(),
            controller: titleController,
            focusNode: titleFocusNode,
            autofocus: true,
            onFieldSubmitted: (value) {
              ref.read(titleTextControllerProvider).text = value;

              FocusScope.of(context).requestFocus(descFocusNode);
            },
            decoration: const InputDecoration(
                labelText: 'Title', hintText: 'eg. cry more'),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: descController,
            focusNode: descFocusNode,
            style: AppTextStyles.normal(),
            autofocus: true,
            onFieldSubmitted: (value) {
              ref.read(descTextControllerProvider).text = value;
              insertTask(ref, titleController.text,
                  description: descController.text);
              ref.invalidate(taskListProvider);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Task added to the database'),
                duration: Duration(seconds: 1),
              ));
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

            insertTask(ref, titleController.text,
                description: descController.text);
            ref.invalidate(taskListProvider);

            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Task added to the database'),
              duration: Duration(seconds: 1),
            ));
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
