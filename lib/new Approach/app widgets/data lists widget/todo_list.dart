import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/providers/state%20provider/todo_state.dart';



class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListAsync = ref.watch(todoListProvider);

    // return Scaffold(
    //   body: taskListAsync.when(
    //     data: (tasks) {
    //       if (tasks.isEmpty) {
    //         return Center(
    //             child: SingleChildScrollView(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Image.asset(
    //                 'assets/images/empty file.png',
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //               Text(
    //                 'No tasks available.',
    //                 style: AppTextStyles.normal(),
    //               ),
    //             ],
    //           ),
    //         ));
    //       }
    //       return ListView.builder(
    //         itemCount: tasks.length,
    //         itemBuilder: (context, index) {
    //           final task = tasks[index];
    //           return Padding(
    //             padding:
    //                 const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    //             child: ListTile(
    //                 onLongPress: () {
    //                   showDialog(
    //                     context: context,
    //                     builder: (context) => UpdateTaskDialog(
    //                         task: task), // Pass the task to edit
    //                   );
    //                 },
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(12)),
    //                 tileColor: task['isDone'] == 1
    //                     ? Colors.lightGreen.withOpacity(0.4)
    //                     : Colors.lightBlue.withOpacity(0.18),
    //                 title: Text(
    //                   task['title'] ?? 'No Title',
    //                   style: AppTextStyles.bold(),
    //                 ), // Ensure correct field name
    //                 subtitle: Text(
    //                   task['desc'] ?? 'No Description',
    //                   style: AppTextStyles.normal(
    //                       fontSize: 16, color: Colors.black87),
    //                 ),
    //                 trailing: Row(
    //                   mainAxisSize: MainAxisSize.min,
    //                   children: [
    //                     Checkbox(
    //                       value: task['isDone'] == 1,
    //                       onChanged: (value) {
    //                         toggleTaskStatus(ref, task['id']);
    //                       },
    //                     ),
    //                     IconButton(
    //                         onPressed: () {
    //                           showDialog(
    //                             context: context,
    //                             builder: (context) {
    //                               return DeleteTaskAlert(task: task);
    //                             },
    //                           );
    //                         },
    //                         icon: const Icon(Icons.delete))
    //                   ],
    //                 )),
    //           );
    //         },
    //       );
    //     },
    //     loading: () => const Center(child: CircularProgressIndicator()),
    //     error: (err, stack) => Center(
    //         child: Text(
    //       'Error: $err',
    //       style: AppTextStyles.normal(color: Colors.red),
    //     )),
    //   ),
    // );
  }
}
