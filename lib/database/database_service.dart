import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? db;
  static final DatabaseService instance = DatabaseService._constructor();

  static String taskTableName = 'tasks'; // Make it a static const
  static String taskId = 'id';
  static String taskName = 'title';
  static String taskStatus = 'isDone';
  static String taskDesc = 'description';

  DatabaseService._constructor();

  Future<Database> get database async {
    if (db != null) {
      return db!;
    }
    db = await getDatabase();
    return db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final dbPath = join(databaseDirPath, 'main_todo_db.db');
    final database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $taskTableName (
            $taskId INTEGER PRIMARY KEY AUTOINCREMENT,
            $taskName TEXT NOT NULL,
            $taskStatus INTEGER NOT NULL
          )
        ''');
      },
    );
    return database; // Ensure the database is returned
  }

  //methods
  void addTaskDB(String content) async {
    final db = await database;
    await db.insert(taskTableName, {
      taskName: content,
      taskStatus: 0,
    });
  }
}
