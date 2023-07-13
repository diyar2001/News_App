import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    print('Init ...');
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'news_db.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE items (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            source TEXT NULL,
            author TEXT NULL,
            title TEXT NULL,
            description TEXT NULL,
            urlToImage TEXT NULL,
            publishedAt TEXT NULL,
            content TEXT NULL,
            url TEXT NULL
          )
        ''');
      },
    );
  }

//add data into sql database
  Future<void> addItem(Map<String, dynamic> itemData) async {
    final db = await database;
    await db.insert('items', itemData);
  }

//get all datas from sql database
  Future<List<Map<String, dynamic>>> getAllItems() async {
    final db = await database;
    return await db.query('items');
  }

//remove all data from sql database
  Future<int> removeAll() async {
    final db = await database;
    final result = db.delete('items');
    return result;
  }

//delete single data by id
  Future<int> removeItem(String id) async {
    final db = await database;
    //here i am using urlToImage as items ID
    final result = db.delete('items', where: "urlToImage = '${id}'");
    return result;
  }
}
