import 'dart:ffi';

import 'package:sqflite/sqflite.dart';

import '../models/task_model.dart';

class DbHelper {
  static Database? db;
  static final int version = 1;
  static final String tableName = "tasks";

  static Future<void> initDb() async {
    if (db != null) {
      return;
    }

    final String? startTime;
    final String? endTime;
    final String? repeat;
    final int? color;
    final int? remind;
    final int? isCompleted;

    try {
      String path = await getDatabasesPath() + "task.db";
      db = await openDatabase(path, version: version, onCreate: (db, version) {
        print("creating a new db");
        return db.execute("CREATE TABLE $tableName("
            "taskId INTEGER PRIMARY KEY AUTOINCREMENT,"
            "title STRING,note TEXT , date STRING,"
            " startTime STRING ,endTime STRING , "
            "repeat STRING ,"
            "color INTEGER,"
            "remind INTEGER,isCompleted INTEGER)",);
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert({required Task task}) async {
    print("inserting");

    return await db?.insert(tableName, task.toJson()) ?? 1;
  }
}
