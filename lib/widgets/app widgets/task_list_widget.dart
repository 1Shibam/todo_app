import 'package:flutter/material.dart';
import 'package:todo_app/databasae/database_methods.dart';
import 'package:todo_app/providers/provider_exports.dart';
import 'package:todo_app/providers/quote_provider/task_list_provider.dart';
import 'package:todo_app/widgets/app%20widgets/app_text_styles.dart';
import 'package:todo_app/widgets/app%20widgets/update_task_dialog.dart';

class TaskListWidget extends ConsumerWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListAsync = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Tasks',
        style: AppTextStyles.bold(),
      )),
      body: taskListAsync.when(
        data: (tasks) {
          if (tasks.isEmpty) {
            return const Center(child: Text('No tasks available.'));
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
                        ? Colors.lightGreen.withOpacity(0.18)
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
                    trailing: Checkbox(
                      value: task['isDone'] == 1,
                      onChanged: (value) {
                        toggleTaskStatus(ref, task['id']);
                      },
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
