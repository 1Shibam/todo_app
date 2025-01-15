import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/oldLibFolders(not%20using%20them)/methods/show_name_dialog.dart';
import 'package:todo_app/oldLibFolders(not%20using%20them)/providers/item_provider.dart';

class TodoAppHomeScreen extends ConsumerWidget {
  const TodoAppHomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final dataItems = ref.watch(itemProvider);
    return SafeArea(
      child: Scaffold(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            child: Image.asset(''),
                          ),
                          trailing: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          tileColor: Colors.black38,
                          title: Text(dataItems[index].name),
                          subtitle: Text("${(dataItems[index].id)}"),
                        ),
                      ),
                    ],
                  );
                }),
      ),
    );
  }
}
