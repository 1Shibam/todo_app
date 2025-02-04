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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  tileColor: singleData.todoCompleted
                      ? Colors.lightGreen.withOpacity(0.3)
                      : Colors.lightBlue.withOpacity(0.3),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 0, 35, 65), width: 2),
                        activeColor: Colors.blue,
                        value: singleData.todoCompleted == true,
                        onChanged: (value) {
                          ref
                              .read(todoListProvider.notifier)
                              .toggleCompletion(singleData);
                        },
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 0, 35, 65),
                            size: 26,
                          ))
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
