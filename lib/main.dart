import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/databasae/database.dart';
import 'package:todo_app/screens/app%20screens/tasks_screen.dart';
import 'package:todo_app/widgets/widgets_export.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  TodoDatabase dbHelper = TodoDatabase();
  Database db = await dbHelper.getDataBase();

  // Inserting a task
  await db.insert('tasks', {'taskTitle': 'Learn Flutter', 'isDone': 0});

  // Fetching tasks
  List<Map<String, dynamic>> tasks = await db.query('tasks');
  for (var task in tasks) {
    print('Task: ${task['taskTitle']} - Completed: ${task['isDone'] == 1}');
  }
  debugPaintSizeEnabled = false;
  runApp(const ProviderScope(child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          
          hintStyle: AppTextStyles.normal(color: Colors.grey),
          labelStyle: AppTextStyles.normal(fontSize: 12, color: Colors.grey),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey, // Border color when not focused
              width: 1.5,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue, // Border color when focused
              width: 2.0,
            ),
          ),
        ),
      ),
      home: const TasksScreen(),
    );
  }
}
