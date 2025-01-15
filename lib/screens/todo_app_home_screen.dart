import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers/item_provider.dart';

class TodoAppHomeScreen extends ConsumerWidget {
  const TodoAppHomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final dataItems = ref.watch(itemProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('newItem');
        },
        child: const Text('+'),
      ),
      body: ListView.builder(
        
        itemCount: dataItems.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(title: Text(dataItems[index].name)),
            ],
          );
        },
      ),
    );
  }
}
