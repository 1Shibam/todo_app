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
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TodaysQuote(),
            Expanded(child: TaskListWidget()),
          ],
        ),
      ),
    );
  }
}
