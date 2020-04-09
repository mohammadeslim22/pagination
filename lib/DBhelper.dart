import 'package:database_create_error/joinobject.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'notes.dart';
import 'user.dart';

class DBHelper {
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'student.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE Notes (note_id INTEGER PRIMARY KEY, user_id INTEGER, desc TEXT)');    

    await db.execute('CREATE TABLE Users (user_id INTEGER PRIMARY KEY, title TEXT,name TEXT ,phones TEXT)');
  }

  Future<Note> addNote(Note note) async {
    var dbClient = await db;
    await dbClient.insert('Notes', note.toMap());
    return note;
  }
    Future<User> adduser(User user) async {
    var dbClient = await db;
    await dbClient.insert('Users', user.toMap());
    return user;
  }

  Future<List<JoinObject>> getJoinData() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        'SELECT * FROM Notes,Users where Notes.note_id =Users.user_id order by user_id ASC');
    List<Map> maps = result;
    List<JoinObject> joinobjs = [];

    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        joinobjs.add(JoinObject.fromMapObject(maps[i]));
      }
    }
    return joinobjs;
  }

    Future<List<JoinObject>> getJoinDatapaging(int offset, int limit) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
     // 'SELECT * FROM Notes,Users where Notes.note_id =Users.user_id order by user_id ASC');
         'SELECT * FROM Notes,Users where Notes.note_id =Users.user_id AND Users.user_id > $offset AND Users.user_id <= $limit order by user_id ASC');
    List<Map> maps = result;
    List<JoinObject> joinobjs = [];
            print("from inside the get method ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//////////////////////////////////////////////");
      print(maps.isEmpty);
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        joinobjs.add(JoinObject.fromMapObject(maps[i]));
            print("from inside the get method ///@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//////////////////////////////////////////////");

      }
    }
    return joinobjs;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(
      'student',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
