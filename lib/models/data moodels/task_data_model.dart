class TaskDataModel {
  final int id;
  final String title;
  String? desc;
  bool? isDone;
  bool? isDeleted;
  TaskDataModel({
    required this.id,
    required this.title,
    this.desc,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  TaskDataModel copyWith({
    int? id,
    String? title,
    String? desc,
    bool? isDone,
    bool? isDeleted,
  }) {
    return TaskDataModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc?? this.desc,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id' : id,
      'title': title,
      'desc' : desc,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory TaskDataModel.fromMap(Map<String, dynamic> map) {
    return TaskDataModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      isDone: map['isDone'] ?? false,
      isDeleted: map['isDeleted'] ?? false,
    );
  }
}
