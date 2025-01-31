// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodosModel {
  final int? todoID;
  final String todoTitle;
  final String? todoDesc;
  final String? todoStartDate;
  final String? todoEndDate;
  final bool todoCompleted;
  final bool todoDeleted;

  TodosModel(
      {this.todoID,
      required this.todoTitle,
      this.todoDesc,
      this.todoStartDate,
      this.todoEndDate,
      this.todoCompleted = false,
      this.todoDeleted = false});

  //!convert from Map (for database)

  factory TodosModel.fromMap(Map<String, dynamic> map) {
    return TodosModel(
        todoID: map['todoID'],
        todoTitle: map['todoTitle'],
        todoDesc: map['todoDesc'],
        todoStartDate: map['todoStartDate'],
        todoEndDate: map['todoEndDate'],
        todoCompleted: map['todoCompleted'] == 1,
        todoDeleted: map['todoDeleted'] == 1);
  }

  //!convert to map (for database)
  Map<String, dynamic> toMpa() {
    return {
      'todoID': todoID,
      'todoTitle': todoTitle,
      'todoDesc': todoDesc,
      'todoStartDate': todoStartDate,
      'todoEndDate': todoEndDate,
      'todoCompleted': todoCompleted ? 1 : 0,
      'todoDeleted': todoDeleted ? 1 : 0
    };
  }

  //! copyWith method
  
}
