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

      //convert from Map (for database)
}
