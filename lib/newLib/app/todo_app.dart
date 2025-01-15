import 'package:flutter/material.dart';
import 'package:todo_app/newLib/screens/todo_home_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TodoHomeScreen(),
    );
  }
}