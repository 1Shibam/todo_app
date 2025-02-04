import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:todo_app/providers/state%20provider/todo_completed_state.dart';

import 'package:todo_app/themes/app_text_styles.dart';

class CompletedTodosList extends ConsumerWidget {
  const CompletedTodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(completedTodosListProvider);
    return todoData.isEmpty
        ? Center(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/images/incomplete-hand-drawn-symbol-svgrepo-com.png'),
                  Text(
                    'No todos are Completed yet, Don\'t be lazy you will regret later!!',
                    style: AppTextStyles.bold(),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        : ListView.builder(
            itemCount: todoData.length,
            itemBuilder: (context, index) {
              final singleData = todoData[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  tileColor: Colors.green.withOpacity(0.3),
                  trailing: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      )
                    ],
                  ),
                  title: Text(
                    singleData.todoTitle,
                    style: AppTextStyles.bold(fontSize: 20),
                  ),
                ),
              );
            },
          );
  }
}
