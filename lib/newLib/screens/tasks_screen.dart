import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/newLib/models/task_data_model.dart';
import 'package:todo_app/newLib/providers/Task%20Providers/task_list_provider.dart';
import 'package:todo_app/newLib/widgets/app_text_styles.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*Testing list

     List<TaskDataModel> data = [
      TaskDataModel(title: 'Home work'),
       TaskDataModel(title: 'Jerk Off'),
      TaskDataModel(title: 'More Home work'),
      TaskDataModel(title: 'A lot of Jerk Off'),
    ];*/
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Todos',
          style: AppTextStyles.bold(fontSize: 32),
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          return FloatingActionButton(
            onPressed: () {
              final newTask = TaskDataModel(title: 'New Task');
              ref.read(taskListProvider.notifier).addTask(newTask);
            },
            backgroundColor: Colors.grey,
            child: const Icon(Icons.add_task),
          );
        },
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final tasks = ref.watch(taskListProvider);
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
                          IconButton(onPressed: (){
                            ref.read(taskListProvider.notifier).deleteTask(task.title);
                          }, icon: const Icon(Icons.delete))
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
        },
      ),
    );
  }
}
