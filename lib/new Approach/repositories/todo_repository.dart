import 'package:todo_app/new%20Approach/model/todos_model.dart';
import 'package:todo_app/new%20Approach/providers/data%20provider/todo_data_source.dart';

class TodoRepository {
  final TodoDataSource dataSource;
  TodoRepository(this.dataSource);

  Future<List<TodosModel>> fetchTodoList() => dataSource.getTodosList();
  Future<int> insertTodo(TodosModel todo) => dataSource.createTodo(todo);
  Future<int> updateTodo(TodosModel todo) => dataSource.updateTodo(todo);
  Future<int> deleteTodo(int id) => dataSource.deleteTodo(id);
}
