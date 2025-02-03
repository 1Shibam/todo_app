import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/new%20Approach/UI/widgets/floating_action_widget.dart';
import 'package:todo_app/new%20Approach/providers/state%20provider/todo_state.dart';

import '../app widgets/others/app_text_styles.dart';

//! this is the Todo home screen!!
class TodoHomeScreen extends ConsumerWidget {
  const TodoHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(todoListProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Todos',
            style: AppTextStyles.bold(),
          ),
        ),
        floatingActionButton: const FloatingActionWidget(),
        body: todoData.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/empty file.png'),
                    const Text('NO todos are added yet!!')
                  ],
                ),  
              )
            : ListView.builder(
                itemCount: todoData.length,
                itemBuilder: (context, index) {
                  final singleData = todoData[index];
                  return ListTile(
                    title: Text(singleData.todoTitle),
                  );
                },
              ));
  }
}
