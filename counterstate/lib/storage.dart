import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

const String tableCount = 'countTable';
const String columnId = '_id';
const String columnCount = 'count';

class CountObject {
  late int id;
  late int count;

  Map<String, dynamic> toMap() {
    var map = <String, Object?>{
      columnCount: count,
      columnId: id,
    };
    return map;
  }

  CountObject();

  CountObject.fromMap(Map<dynamic, dynamic> map) {
    id = map[columnId]!;
    count = map[columnCount]!;
  }
}

class CounterStorage {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table $tableCount (
          $columnId integer primary key autoincrement,
          $columnCount integer not null)
        ''');
    });
  }

  Future<CountObject> insert(CountObject todo) async {
    todo.id = await db.insert(tableCount, todo.toMap());
    return todo;
  }

  Future<CountObject> getCount(int id) async {
    List<Map> maps = await db.query(tableCount,
        columns: [columnId, columnCount],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return CountObject.fromMap(maps.first);
    }
    CountObject co = CountObject();
    co.count = 0;
    co.id = id;
    co = await insert(co);
    return co;
  }

  Future<int> update(CountObject co) async {
    return await db.update(tableCount, co.toMap(),
        where: '$columnId = ?', whereArgs: [co.id]);
  }

  Future<bool> writeCounter(int counter) async {
    try {
      await open("mydata.db");
      CountObject co = CountObject();
      co.count = counter;
      co.id = 0;
      await update(co);
      await close();
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return false;
  }

  Future close() async => db.close();

  Future<int> readCounter() async {
    try {
      await open("mydata.db");
      CountObject co = await getCount(0);
      await close();
      return co.count;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      bool writeSuccess = await writeCounter(0);
      if (writeSuccess) {
        return 0;
      }
    }
    return -1;
  }
}
