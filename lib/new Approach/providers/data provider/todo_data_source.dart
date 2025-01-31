import 'package:sqflite/sqflite.dart';
import 'package:todo_app/new%20Approach/model/todos_model.dart';

class TodoDataSource {
  //instance of database
  final Database database;

  TodoDataSource(this.database);

  //! Todo creation

  Future<int> createTodo(TodosModel todo) async {
    return await database.insert('todoTable', todo.toMap());
  }
}
