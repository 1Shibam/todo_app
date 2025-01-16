import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/newLib/screens/tasks_screen.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const ProviderScope(child: TasksScreen()));
}
