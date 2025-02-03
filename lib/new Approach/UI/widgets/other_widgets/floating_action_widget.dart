import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/themes/app_text_styles.dart';

class FloatingActionWidget extends ConsumerStatefulWidget {
  const FloatingActionWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FloatingActionWidgetState();
}

class _FloatingActionWidgetState extends ConsumerState<FloatingActionWidget> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descFocusNode = FocusNode();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();

    super.dispose();
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
              content: Column(
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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Task added to list',
                            style: AppTextStyles.normal(color: Colors.white)),
                        duration: const Duration(seconds: 1),
                      ));
                    },
                    decoration: const InputDecoration(
                        labelText: 'Description', hintText: 'lol lmao'),
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
                    style:
                        AppTextStyles.normal(color: Colors.black, fontSize: 12),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save input to the state

                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Task added to the database'),
                      duration: Duration(seconds: 1),
                    ));
                  },
                  child: Text(
                    'Submit',
                    style:
                        AppTextStyles.normal(color: Colors.black, fontSize: 12),
                  ),
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
