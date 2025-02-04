// ignore_for_file: use_build_context_synchronously, , unused_local_variable, unused_local_variable

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/UI/screens/todo_home_screen.dart';

import '../../database/database_provider.dart';

class TodoSplashScreen extends ConsumerStatefulWidget {
  const TodoSplashScreen({super.key});

  @override
  ConsumerState<TodoSplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<TodoSplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      // Wait for the database to be ready
      // ignore: unused_local_variable
      final database = await ref.read(databaseProvider.future);
      // print("Database is ready!"); // This will print once the database is ready

      //? added delay using splash screen to make sure database gets initialized properly!!
      await Future.delayed(const Duration(seconds: 2));

      // After initialization, navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const TodoHomeScreen()),
      );
    } catch (error) {
      // Handle errors, possibly showing a retry button on the splash screen
      throw Exception("Error during initialization: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Display a simple splash screen UI
    return Scaffold(
      body: Center(
        child: Image.asset('assets/animations/todo loading animation.gif'),
      ),
    );
  }
}
