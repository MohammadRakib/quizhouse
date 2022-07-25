import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbRepository{
  static final DbRepository _dbRepository = DbRepository._();
  static Database? _database;

  DbRepository._();

  factory DbRepository(){
    return _dbRepository;
  }

// get the database
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('quiz.db');
    return _database!;
  }

// create the database
  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    // users table
    String id = 'id INTEGER PRIMARY KEY AUTOINCREMENT';
    String name = 'name TEXT NOT NULL';
    String email = 'email TEXT NOT NULL';
    String password = 'password TEXT NOT NULL';
    String loginStatus = 'loginStatus BOOLEAN NOT NULL';
    String exp = 'exp INTEGER NOT NULL';
    String lvl = 'lvl INTEGER NOT NULL';
    String coin = 'coin INTEGER NOT NULL';
    String gems = 'gems INTEGER NOT NULL';
    String sqlUser = 'CREATE TABLE users($id, $name, $email, $password, $loginStatus, $exp, $lvl, $coin, $gems)';

    db.execute(sqlUser);

  }
}