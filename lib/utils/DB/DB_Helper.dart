import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static DBHelper dbHelper = DBHelper._();

  DBHelper._();

  Database? database;

  Future<Database?> checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await createDB();
    }
  }

  Future<Database> createDB() async {
    Directory directorye = await getApplicationDocumentsDirectory();
    String path = join(directorye.path, 'bookData.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT, quote TEXT, color TEXT)";
        db.execute(query);
      },
    );
  }

  Future<void> insertData({required String category, required String quote,required String color}) async {
    database = await checkDB();
    database!.insert("category", {"category": category, "quote": quote, "color" : color}).then((value) {}).catchError((error){
      }
    );
  }

  Future<List<Map>> readData() async {
    database = await checkDB();
    String query = "SELECT * FROM category";

    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<void> Deletdata(id)
  async {
    database = await checkDB();
    database!.delete("category",whereArgs: [id],where: "id = ?");
  }
}
