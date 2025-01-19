// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:todo_app/widgets/widgets_export.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //devices screen height and width
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //defining padding and font size
    final double padding = screenWidth * 0.034;
    final double titleFontSize = screenHeight * 0.04;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Todos',
          style: AppTextStyles.bold(fontSize: titleFontSize),
        ),
      ),
      floatingActionButton: const FloatingActionButtonWidget(),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TodaysQuote(),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Your task will Appear below - ',
              style: AppTextStyles.bold(),
            ),
            const SizedBox(
              height: 12,
            ),
            const TaskListWidget(),
          ],
        ),
      ),
    );
  }
}
