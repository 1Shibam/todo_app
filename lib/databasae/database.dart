import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabase {
  Future<Database> getDataBase() async {
    var dbPath = await getDatabasesPath();
    print('Database path: $dbPath'); // Debugging line
    String path = join(dbPath, 'task_database.db');

    //delete if there is any existing database
    await deleteDatabase(path);

    //open the database
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
                        CREATE TABLE tasks (taskId INTEGER PRIMARY KEY, 
                        taskTitle TEXT NOT NULL, 
                        isDone INTEGER NOT NULL DEFAULT 0, 
                        isDeleted INTEGER NOT NULL DEFAULT 0)
                        ''');
      },
    );
    return database;
  }
}
