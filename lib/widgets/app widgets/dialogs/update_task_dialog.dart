// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';
// import 'package:todo_app/databasae/database_methods.dart';
// import 'package:todo_app/providers/data%20providers/provider_exports.dart';
// import 'package:todo_app/widgets/widgets_export.dart';

// //Text controllers
// final titleUpdateTextControllerProvider =
//     AutoDisposeProvider<TextEditingController>(
//         (ref) => TextEditingController());
// final descUpdateTextControllerProvider =
//     AutoDisposeProvider<TextEditingController>(
//         (ref) => TextEditingController());

// //Focus Nodes

// final titleFocusNodeProvider =
//     AutoDisposeProvider<FocusNode>((ref) => FocusNode());
// final descFocusNondeProvider =
//     AutoDisposeProvider<FocusNode>((ref) => FocusNode());

// class UpdateTaskDialog extends ConsumerStatefulWidget {
//   final Map<String, dynamic> task;

//   const UpdateTaskDialog({super.key, required this.task});

//   @override
//   _TaskEditPageState createState() => _TaskEditPageState();
// }

// class _TaskEditPageState extends ConsumerState<UpdateTaskDialog> {
//   late TextEditingController titleController =
//       ref.watch(titleUpdateTextControllerProvider);
//   late TextEditingController descController =
//       ref.watch(descUpdateTextControllerProvider);

//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers with current task data
//     titleController = TextEditingController(text: widget.task['title']);
//     descController = TextEditingController(text: widget.task['desc']);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final titleFocusNode = ref.watch(titleFocusNodeProvider);
//     final descFocusNode = ref.watch(descFocusNondeProvider);
//     return AlertDialog(
//       title: Text(
//         'Update Task details',
//         style: AppTextStyles.bold(),
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: titleController,
//             focusNode: titleFocusNode,
//             autofocus: true,
//             decoration: const InputDecoration(labelText: 'Update Title'),
//             onSubmitted: (_) {
//               FocusScope.of(context).requestFocus(descFocusNode);
              
//             },
//           ),
//           const SizedBox(height: 12,),
//           TextField(
//             controller: descController,
//             focusNode: descFocusNode,
//             autofocus: true,
//             decoration: const InputDecoration(labelText: 'Update desc'),
//             onSubmitted: (_) {
//               updateTask(
//                 ref,
//                 widget.task['id'],
//                 titleController.text,
//                 newDescription: descController.text,
//               );
//               Navigator.pop(context);
//             },
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
//         ElevatedButton(
//           onPressed: () {
//             // Call updateTask when the user submits
//             updateTask(
//               ref,
//               widget.task['id'],
//               titleController.text,
//               newDescription: descController.text,
//             );
//             Navigator.pop(context); // Close the edit page after updating
//           },
//           child: const Text('Update Task'),
//         ),
//       ],
//     );
//   }
// }
