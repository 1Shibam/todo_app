// import 'package:flutter/material.dart';
// import 'package:todo_app/models/data%20moodels/task_data_model.dart';
// import 'package:todo_app/providers/provider_exports.dart';

// import '../widgets_export.dart';

// //Text controllers
// final titleUpdateTextControllerProvider = AutoDisposeProvider<TextEditingController>(
//     (ref) => TextEditingController());
// final descUpdateTextControllerProvider = AutoDisposeProvider<TextEditingController>(
//     (ref) => TextEditingController());

// //Focus Nodes

// final titleFocusNodeProvider =
//     AutoDisposeProvider<FocusNode>((ref) => FocusNode());
// final descFocusNondeProvider =
//     AutoDisposeProvider<FocusNode>((ref) => FocusNode());

// class EditTaskDialog extends ConsumerWidget {
//   final TaskDataModel task;

//   const EditTaskDialog({super.key, required this.task});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//      final titleController = ref.watch(titleUpdateTextControllerProvider);
//     final descController = ref.watch(descUpdateTextControllerProvider);
//     final titleFocusNode = ref.watch(titleFocusNodeProvider);
//     final descFocusNode = ref.watch(descFocusNondeProvider);


//     return AlertDialog(
//       title: Text(
//         'Update Task details',
//         style: AppTextStyles.bold(),
//       ),
//       content: Column(
//         children: [
//           TextField(
//             controller: titleController,
//             focusNode: titleFocusNode,
//             autofocus: true,
//             decoration: InputDecoration(labelText: 'Title'),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             // Same as submit button

//             Navigator.pop(context); // Close the dialog and save
//           },
//           child: Text(
//             'Cancel',
//             style: AppTextStyles.normal(color: Colors.black, fontSize: 12),
//           ),
//         ),
//         TextButton(
//           onPressed: () {
//             // Same as submit button

//             Navigator.pop(context); // Close the dialog and save
//           },
//           child: Text(
//             'Cancel',
//             style: AppTextStyles.normal(color: Colors.black, fontSize: 12),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // Save the updated task



//             Navigator.pop(context); // Close the dialog
//           },
//           child: Text(
//             'Save',
//             style: AppTextStyles.normal(color: Colors.black, fontSize: 12),
//           ),
//         ),
//       ],
//     );
//   }
// }
