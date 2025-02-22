import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/UI/widgets/dialogs/delete_task_permanently_dialog.dart';
import 'package:todo_app/UI/widgets/dialogs/restore_task_dialog.dart';
import 'package:todo_app/providers/state%20provider/todo_deleted_state.dart';

import 'package:todo_app/themes/app_text_styles.dart';

class DeletedTodosList extends ConsumerWidget {
  const DeletedTodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(deletedTodoListProvider);
    return todoData.isEmpty
        ? Center(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/recycle-bin-full-svgrepo-com.png'),
                  Text(
                    'No todos are Deleted yet',
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    tileColor: Colors.red.withOpacity(0.3),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return RestoreTaskDialog(
                                      id: singleData.todoID!);
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.restore,
                              color: Color.fromARGB(255, 126, 0, 0),
                              size: 26,
                            )),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return DeleteTaskPermanentlyDialog(
                                      id: singleData.todoID!);
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 126, 0, 0),
                              size: 26,
                            )),
                      ],
                    ),
                    title: Text(
                      singleData.todoTitle,
                      style: AppTextStyles.bold(fontSize: 20),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
