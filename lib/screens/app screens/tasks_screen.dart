import 'package:flutter/material.dart';
import 'package:todo_app/widgets/widgets_export.dart';
import 'package:todo_app/providers/provider_exports.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Todos',
          style: AppTextStyles.bold(fontSize: 32),
        ),
      ),
      // floatingActionButton: Consumer(
      //   builder: (context, ref, child) {
      //     final taskTitle = ref.watch(firstTextController);
      //     return FloatingActionButton(
      //       onPressed: () {
      //         const CreateTaskDetailsWidget();
      //         final newTask = TaskDataModel(title: taskTitle.text );
      //         ref.read(taskListProvider.notifier).addTask(newTask);
      //       },
      //       backgroundColor: Colors.grey,
      //       child: const Icon(Icons.add_task),
      //     );
      //   },
      // ),
      floatingActionButton: Consumer(
  builder: (context, ref, child) {
    
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
  },
),
      body: const TaskListWidget(),
    );
  }
}
