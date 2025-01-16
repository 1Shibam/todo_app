//task data model class
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
class TaskDataModel extends Equatable {
  final String id;
  final String title;
  bool? isDone;
  bool? isDeleted;
  TaskDataModel({
    required this.title,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TaskDataModel copyWith({
    String? title,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskDataModel(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskDataModel.fromMap(Map<String, dynamic> map) {
    return TaskDataModel(
      title: map['title'] ?? '',
      isDone: map['isDone'] ?? false,
      isDeleted: map['isDeleted'] ?? false,
    );
  }

  @override
  List<Object?> get props => [
    title, isDone, isDeleted
  ];
}
