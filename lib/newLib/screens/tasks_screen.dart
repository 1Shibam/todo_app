import 'package:flutter/material.dart';
import 'package:todo_app/newLib/widgets/app_text_styles.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello world!',
          style: AppTextStyles.normal(),
        ),
      ),
    );
  }
}
