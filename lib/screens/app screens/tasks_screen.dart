import 'package:flutter/material.dart';
import 'package:todo_app/widgets/widgets_export.dart';

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
      floatingActionButton: const FloatingActionButtonWidget(),
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

