import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/providers/state%20provider/todo_state.dart';
import 'package:todo_app/new%20Approach/themes/app_text_styles.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(todoListProvider);
    return todoData.isEmpty
        ? Center(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/empty file.png'),
                  Text(
                    'No todos are added yet',
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
              return ListTile(
                title: Text(singleData.todoTitle),
              );
            },
          );
  }
}
