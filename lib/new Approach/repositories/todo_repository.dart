import 'package:todo_app/new%20Approach/model/todos_model.dart';
import 'package:todo_app/new%20Approach/providers/data%20provider/todo_data_source.dart';

class TodoRepository {
  final TodoDataSource dataSource;
  TodoRepository(this.dataSource);

  Future<List<TodosModel>> fetchTodoList() => dataSource.getTodosList();
}
