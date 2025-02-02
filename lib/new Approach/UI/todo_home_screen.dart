import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app/new%20Approach/app%20widgets/others/app_text_styles.dart';
import 'package:todo_app/new%20Approach/providers/state%20provider/todo_state.dart';

class TodoHomeScreen extends ConsumerWidget {
  const TodoHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todos',
          style: AppTextStyles.bold(),
        ),
        centerTitle: true,
      ),
      body: ListView.builder( itemCount: todos.length, itemBuilder: (context, index) {
        
        
      },)
    );
  }
}
