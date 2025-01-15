import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemNameProvider = StateProvider<String>((ref) => '');
final textController =
    Provider<TextEditingController>((ref) => TextEditingController());

void _showNameDialog(BuildContext context, WidgetRef ref) {
  final controller = ref.watch(textController);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Enter Item Name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Item name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog without saving
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Save the input to Riverpod state
              ref.read(itemNameProvider.notifier).state = controller.text;
              Navigator.of(context).pop(); // Close dialog after saving
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}
