import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../others/app_text_styles.dart';

class DeletedTasksList extends ConsumerWidget {
  const DeletedTasksList({super.key});

  get taskListAsync => null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: taskListAsync.when(
        data: (tasks) {
          if (tasks.isEmpty) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/recycle-bin-full-svgrepo-com.png',
                  height: 160,
                  width: 160,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'No Deleted tasks available.',
                  style: AppTextStyles.normal(),
                ),
              ],
            ));
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  tileColor: Colors.red.withOpacity(0.5),
                  title: Text(
                    task['title'] ?? 'No Title',
                    style: AppTextStyles.bold(),
                  ),
                  subtitle: Text(
                    task['desc'] ?? 'No Description',
                    style: AppTextStyles.normal(
                        fontSize: 16, color: Colors.black87),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog();
                          },
                        );
                      },
                      icon: const Icon(Icons.restore_page)),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
            child: Text(
          'Error: $err',
          style: AppTextStyles.normal(color: Colors.red),
        )),
      ),
    );
  }
}
