import 'package:sqflite/sqflite.dart' as sqlite;

class DBHelper {
  static Future<void> createTable(sqlite.Database database) async {
    await database.execute("""CREATE TABLE data(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title VARCHAR(255),
      desc TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,      
      updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,      
    )""");
  }

  static Future<sqlite.Database> db() async {
    return sqlite.openDatabase("flutter_test_app_database.db", version: 1,
        onCreate: (sqlite.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<int> createData(String title, String desc) async {
    final db = await DBHelper.db();
    final data = {'title': title, 'desc': desc};
    final id = await db.insert('data', data,
        conflictAlgorithm: sqlite.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await DBHelper.db();
    return db.query('data', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> findOne(int id) async {
    final db = await DBHelper.db();
    return db.query('data', where: 'id = ?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateData(int id, String title, String desc) async {
    final db = await DBHelper.db();

    final data = {'title': title, 'desc': desc, 'updatedAt': DateTime.now()};

    final result =
        await db.update('data', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteDatabase(int id) async{
    final db = await DBHelper.db();
    try{
      await db.delete('data', where: 'id = ?', whereArgs: [id]);
    }catch(err){

    }
  }
}
