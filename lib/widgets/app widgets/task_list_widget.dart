import 'package:flutter/material.dart';
import 'package:todo_app/databasae/database_methods.dart';
import 'package:todo_app/providers/provider_exports.dart';
import 'package:todo_app/providers/task_list_provider.dart';
import 'package:todo_app/widgets/widgets_export.dart';

import 'update_task_dialog.dart';

class TaskListWidget extends ConsumerWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListAsync = ref.watch(taskListProvider);

    return Scaffold(
      body: taskListAsync.when(
        data: (tasks) {
          if (tasks.isEmpty) {
            return Center(
                child: Text(
              'No tasks available.',
              style: AppTextStyles.normal(),
            ));
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: ListTile(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) => UpdateTaskDialog(
                            task: task), // Pass the task to edit
                      );
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    tileColor: task['isDone'] == 1
                        ? Colors.lightGreen.withOpacity(0.4)
                        : Colors.lightBlue.withOpacity(0.18),
                    title: Text(
                      task['title'] ?? 'No Title',
                      style: AppTextStyles.bold(),
                    ), // Ensure correct field name
                    subtitle: Text(
                      task['desc'] ?? 'No Description',
                      style: AppTextStyles.normal(
                          fontSize: 16, color: Colors.black87),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: task['isDone'] == 1,
                          onChanged: (value) {
                            toggleTaskStatus(ref, task['id']);
                          },
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return DeleteTaskAlert(task: task);
                                },
                              );
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    )
                    // Icon(task['isDone'] == 1 ? Icons.check : Icons.close),
                    ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
            child: Text(
          'Error: $err',
          style: AppTextStyles.normal(color: Colors.red),
        )),
      ),
    );
  }
}

