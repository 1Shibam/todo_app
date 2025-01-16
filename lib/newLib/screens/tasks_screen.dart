import 'package:flutter/material.dart';
import 'package:todo_app/newLib/models/task_data_model.dart';
import 'package:todo_app/newLib/widgets/app_text_styles.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskDataModel> data = [
      TaskDataModel(title: 'Home work'),
      TaskDataModel(title: 'Jerk Off'),
      TaskDataModel(title: 'More Home work'),
      TaskDataModel(title: 'A lot of Jerk Off'),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Todos',
          style: AppTextStyles.bold(fontSize: 32),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                var task = data[index];
                return ListTile(
                  trailing: Checkbox(
                    value: task.isDone,
                    onChanged: (value) {
                      task.copyWith(isDone: value);
                    },
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
      ),
    );
  }
}
