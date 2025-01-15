import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/screens/new_home_screen.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const ProviderScope(child: TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue, centerTitle: false),
          useMaterial3: true,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.blue,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey)),
      home: const NewHomeScreen(),
    );
  }
}
