import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/item_provider.dart';

final itemNameProvider = StateProvider<String>((ref) => '');
final itemIDProvider = StateProvider<int>((ref) => 0);
final nameTextController =
    Provider<TextEditingController>((ref) => TextEditingController());
final idTextController =
    Provider<TextEditingController>((ref) => TextEditingController());

void showNameDialog(BuildContext context, WidgetRef ref) {
  final nameController = ref.watch(nameTextController);
  final idController = ref.watch(idTextController);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Enter Item Details'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: 'Item name', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                    hintText: 'Item Id', border: OutlineInputBorder()),
              ),
            ],
          ),
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
              ref
                  .read(itemProvider.notifier)
                  .addItem(nameController.text, int.parse(idController.text));
              Navigator.of(context).pop(); // Close dialog after saving
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}
