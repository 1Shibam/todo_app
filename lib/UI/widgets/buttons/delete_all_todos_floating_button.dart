import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dialogs/delete_all_todos_alert_dialog.dart';

class DeleteAllTodosFloatingButton extends ConsumerWidget {
  const DeleteAllTodosFloatingButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return const DeleteAllTodosAlertDialog();
          },
        );
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
