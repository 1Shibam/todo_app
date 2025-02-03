import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/providers/state%20provider/todo_state.dart';


class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(todoListProvider);
    return todoData.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/empty file.png'),
                const Text('NO todos are added yet!!')
              ],
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