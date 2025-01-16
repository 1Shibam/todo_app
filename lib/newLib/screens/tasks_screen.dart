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
      body: const TaskListWidget(),
    );
  }
}


