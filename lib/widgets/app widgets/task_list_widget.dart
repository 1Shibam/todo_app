import 'package:flutter/material.dart';
import 'package:todo_app/providers/provider_exports.dart';
import 'package:todo_app/providers/quote_provider/task_list_provider.dart';

class TaskListWidget extends ConsumerWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListAsync = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: taskListAsync.when(
        data: (tasks) {
          if (tasks.isEmpty) {
            return const Center(child: Text('No tasks available.'));
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(
                    task['title'] ?? 'No Title'), // Ensure correct field name
                subtitle: Text(task['desc'] ?? 'No Description'),
                trailing: Icon(task['isDone'] == 1 ? Icons.check : Icons.close),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
