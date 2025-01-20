import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  setDataBase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'dbToDo');
    var database = await openDatabase(path, version: 1, onCreate: )
  }

  onDataBaseCreation(Database database, int version) async{
    await database.execute("");

  }
}
