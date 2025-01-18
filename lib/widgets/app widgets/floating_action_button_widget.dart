import 'package:flutter/material.dart';
import 'package:todo_app/providers/provider_exports.dart';
import 'package:todo_app/widgets/app%20widgets/create_task_details_widget.dart';

class FloatingActionButtonWidget extends ConsumerWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const CreateTaskDetailsWidget();
                },
              );
            },
            backgroundColor: Colors.grey,
            child: const Icon(Icons.add_task),
          );
  }
}