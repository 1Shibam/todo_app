// ignore_for_file: public_member_api_docs, sort_constructors_first



class TaskDataModel {
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
      title: map['title'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }
}
