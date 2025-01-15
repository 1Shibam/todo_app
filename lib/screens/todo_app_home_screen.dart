import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/methods/show_name_dialog.dart';
import 'package:todo_app/providers/item_provider.dart';

class TodoAppHomeScreen extends ConsumerWidget {
  const TodoAppHomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final itemName = ref.watch(itemNameProvider);
    // final itemID = ref.watch(itemIDProvider);
    final dataItems = ref.watch(itemProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showNameDialog(context, ref);
          
        },
        child: const Text('+'),
      ),
      body: dataItems.isEmpty
          ? const Center(
              child: Text('No items added yet!!'),
            )
          : ListView.builder(
              itemCount: dataItems.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(title: Text(dataItems[index].name),
                    subtitle: Text("${(dataItems[index].id)}"),),
                  ],
                );
              }),
    );
  }
}
