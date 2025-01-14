import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/item_provider.dart';


class TodoAppHomeScreen extends ConsumerWidget {
  const TodoAppHomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('newItem');
        },
        child: const Text('Add task'),
      ),
      body: const Center(
        child: Text('Hello Bitch San!!'),
      ),
    );
  }
}

