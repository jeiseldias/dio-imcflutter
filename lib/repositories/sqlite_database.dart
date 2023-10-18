import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class SQLiteDatabase {
  Map<int, String> scripts = {
    1: '''
      CREATE TABLE leituras(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        altura INTEGER,
        peso INTEGER
      );
    ''',
    2: '''
      CREATE TABLE dados(
        nome TEXT,
        altura INTEGER
      );
    ''',
    3: '''
      INSERT INTO dados (nome, altura) VALUES ("",175);
    ''',
  };

  static Database? db;

  Future<Database> obterDB() async {
    if (db == null) {
      return await iniciarDB();
    } else {
      return db!;
    }
  }

  Future<Database> iniciarDB() async {
    return await openDatabase(
        path.join(await getDatabasesPath(), 'database.imc'),
        version: scripts.length, onCreate: (Database db, int version) async {
      for (var i = 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
      }
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (var i = oldVersion + 1; i <= scripts.length; i++) {
        await db.execute(scripts[i]!);
      }
    });
  }
}
