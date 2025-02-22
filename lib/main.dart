import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app/UI/screens/todo_splash_screen.dart';

import 'themes/app_text_styles.dart';

void main(ref) async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPaintSizeEnabled = false;
  //! is finished and working fantastic
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
        home: const TodoSplashScreen());
  }
}
