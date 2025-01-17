import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/task%20providers/task_list_provider.dart';
import 'package:todo_app/widgets/app%20widgets/app_text_styles.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final tasks = ref.watch(taskListProvider);
        if (tasks.isEmpty) {
          return Center(child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/empty file.png'),
              Text('There is no tasks yet!!', style: AppTextStyles.normal(),)
            ],

          ),);
        }
        else {
          return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: task.isDone,
                          onChanged: (value) {
                            ref
                                .read(taskListProvider.notifier)
                                .toggleTaskStatus(task.title);
                          },
                        ),
                        IconButton(
                            onPressed: () {
                              ref
                                  .read(taskListProvider.notifier)
                                  .deleteTask(task.title);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                    title: Text(
                      task.title,
                      style: AppTextStyles.normal(),
                    ),
                  );
                },
              ),
            ),
          ],
        );
        }
      },
    );
  }
}
