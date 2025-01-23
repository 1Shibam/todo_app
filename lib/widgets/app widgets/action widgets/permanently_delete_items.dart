import 'package:flutter/material.dart';
import 'package:todo_app/databasae/database_methods.dart';
import 'package:todo_app/providers/data%20providers/provider_exports.dart';
import 'package:todo_app/widgets/widgets_export.dart';

class DeleteAllPermanentlyButton extends StatelessWidget {
  const DeleteAllPermanentlyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Consumer(
              builder: (context, ref, child) {
                return FloatingActionButton(
                  backgroundColor: Colors.white70,
                  child: const Icon(Icons.delete_forever),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            'Are you sure you want to delete all tasks permanently?',
                            style: AppTextStyles.normal(color: Colors.red),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel',
                                    style: AppTextStyles.normal())),
                            TextButton(
                                onPressed: () {
                                  permanentDeleteTask(ref);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Text('Delete',
                                      style: AppTextStyles.normal()),
                                ))
                          ],
                        );
                      },
                    );
                  },
                );
              },
            )));
  }
}
