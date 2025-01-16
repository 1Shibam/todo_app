import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/task_data_model.dart';

class TaskListNotifier extends StateNotifier<List<TaskDataModel>> {
  TaskListNotifier() : super([]);

  // Add a task
  void addTask(TaskDataModel task) {
    state = [...state, task];
  }

  // Toggle the 'isDone' status of a task
  void toggleTaskStatus(String title) {
    state = state.map((task) {
      if (task.title == title) {
        return task.copyWith(isDone: !(task.isDone ?? false));
      }
      return task;
    }).toList();
  }

  // Delete a task by title
  void deleteTask(String title) {
    state = state.where((task) => task.title != title).toList();
  }

  // Clear all deleted tasks
  void clearDeletedTasks() {
    state = state.where((task) => !(task.isDeleted ?? false)).toList();
  }

  // Mark a task as deleted
  void markTaskAsDeleted(String title) {
    state = state.map((task) {
      if (task.title == title) {
        return task.copyWith(isDeleted: true);
      }
      return task;
    }).toList();
  }
}

// Create the TaskListProvider
final taskListProvider = StateNotifierProvider<TaskListNotifier, List<TaskDataModel>>(
  (ref) => TaskListNotifier(),
);

final singleTaskProvider = StateProvider<TaskDataModel>(
  (ref) => TaskDataModel(title: '', isDone: false, isDeleted: false),
);
