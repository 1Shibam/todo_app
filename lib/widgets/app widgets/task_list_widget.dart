import 'package:flutter/material.dart';
import 'package:todo_app/widgets/widgets_export.dart';
import '../../providers/provider_exports.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final tasks = ref.watch(taskListProvider);

        // empty task list state
        if (tasks.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/empty file.png'),
                Text(
                  'There is no tasks yet!!',
                  style: AppTextStyles.normal(),
                )
              ],
            ),
          );
        }
        //when task is added to the list
        else {
          return Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Dismissible(
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        ref
                            .read(taskListProvider.notifier)
                            .deleteTask(task.title);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Task deleted'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    key: Key(task.title),
                    background: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      tileColor: task.isDone!
                          ? Colors.green.withOpacity(0.3)
                          : Colors.lightBlue.withOpacity(0.18),
                      onLongPress: () {
                        // Show the EditTaskDialog on long press
                        showDialog(
                          context: context,
                          builder: (context) => EditTaskDialog(task: task),
                        );
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: task.isDone,
                            onChanged: (value) {
                              ref
                                  .read(taskListProvider.notifier)
                                  .toggleTaskStatus(task.title);
                            },
                          ),
                          IconButton(
                              onPressed: () {
                                ref
                                    .read(taskListProvider.notifier)
                                    .deleteTask(task.title);
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                      title: Text(
                        task.title,
                        style: AppTextStyles.normal(),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
