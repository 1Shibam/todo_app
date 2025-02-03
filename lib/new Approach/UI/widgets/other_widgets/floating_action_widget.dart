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
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: AppTextStyles.normal(),
                    )),
                Container(
                  decoration:
                      BoxDecoration(color: Colors.lightBlue.withOpacity(0.4)),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Create',
                        style: AppTextStyles.bold(),
                      )),
                )
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
