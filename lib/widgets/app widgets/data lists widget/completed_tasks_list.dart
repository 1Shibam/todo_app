// import 'package:flutter/material.dart';
// import 'package:todo_app/providers/data%20providers/completed_tasks_list_provider.dart';
// import 'package:todo_app/providers/data%20providers/provider_exports.dart';
// import 'package:todo_app/widgets/widgets_export.dart';

// class CompletedTaskList extends ConsumerWidget {
//   const CompletedTaskList({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final taskListAsync = ref.watch(completedTasksListProvider);

//     return Scaffold(
//       body: taskListAsync.when(
//         data: (tasks) {
//           if (tasks.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/images/incomplete-hand-drawn-symbol-svgrepo-com.png',
//                     height: 160,
//                     width: 160,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'No task is completed yet!, Lazy?.',
//                     style: AppTextStyles.normal(),
//                   ),
//                 ],
//               ),
//             );
//           }
//           return ListView.builder(
//             itemCount: tasks.length,
//             itemBuilder: (context, index) {
//               final task = tasks[index];
//               return Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//                 child: ListTile(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12)),
//                     tileColor: Colors.green.withOpacity(0.4),
//                     title: Text(
//                       task['title'] ?? 'No Title',
//                       style: AppTextStyles.bold(),
//                     ),
//                     subtitle: Text(
//                       task['desc'] ?? 'No Description',
//                       style: AppTextStyles.normal(
//                           fontSize: 16, color: Colors.black87),
//                     ),
//                     trailing: const Icon(
//                       Icons.check,
//                       color: Colors.green,
//                     )),
//               );
//             },
//           );
//         },
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (err, stack) => Center(
//             child: Text(
//           'Error: $err',
//           style: AppTextStyles.normal(color: Colors.red),
//         )),
//       ),
//     );
//   }
// }
