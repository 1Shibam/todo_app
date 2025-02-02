// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app/new%20Approach/app%20widgets/others/app_text_styles.dart';
import 'package:todo_app/new%20Approach/providers/state%20provider/todo_state.dart';
import 'package:todo_app/new%20Approach/widgets/todo_tile.dart';

import '../widgets/add_todo_dialog';

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
        floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTodoDialog(context, ref),
        child: const Icon(Icons.add),
      ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            print('The length of todo list is == ${todos.length}');
            if (todos.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/empty file.png',
                      height: 60,
                      width: 60,
                    ),
                    Text(
                      'There is no task added yet!!',
                      style: AppTextStyles.bold(),
                    )
                  ],
                ),
              );
            }
            return TodoTile(todosModel: todos[index]);
          },
        ));
  }
}
