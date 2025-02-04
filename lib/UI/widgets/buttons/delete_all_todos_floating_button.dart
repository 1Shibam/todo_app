import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/state provider/todo_deleted_state.dart';
import '../dialogs/delete_all_todos_alert_dialog.dart';

class DeleteAllTodosFloatingButton extends ConsumerWidget {
  const DeleteAllTodosFloatingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deletedTodos = ref.read(deletedTodoListProvider);
    return FloatingActionButton(
      onPressed: () {
        if (deletedTodos.isEmpty) {
          // Show Snackbar if list is empty
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No deleted tasks to clear!'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return const DeleteAllTodosAlertDialog();
            },
          );
        }
      },
      backgroundColor: Colors.red,
      foregroundColor: Colors.red,
      child: const Icon(
        Icons.delete_forever,
        color: Color.fromARGB(255, 110, 7, 0),
      ),
    );
  }
}
