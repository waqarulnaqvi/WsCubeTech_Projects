import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_cubit/model/todo_model.dart';

class DBHelper {
  ///Table
  static const String tableName = "todo";
  static const String columnId = "id";
  static const String columnTitle = "title";
  static const String columnDescription = "description";
  static const String columnPriority = "priority";
  static const String columnIsCompleted = "isCompleted";

  // Private constructor
  DBHelper._private();

  // Singleton instance
  static final DBHelper _instance = DBHelper._private();

  // Factory constructor
  factory DBHelper() => _instance;

  Database? _myDB;

  ///Get Database
  Future<Database> getDB() async {
    return _myDB ??= await openDB();
  }

  ///Open Database
  Future<Database> openDB() async {
    Directory myDir = await getApplicationDocumentsDirectory();
    String dbPath = join(myDir.path, "todo.db");

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT,
        $columnDescription TEXT,
        $columnPriority INTEGER,
        $columnIsCompleted INTEGER
      )
      ''');
      },
    );
  }

  ///Add Data
  Future<bool> addData(TodoModel todoModel) async {
    try {
      Database db = await getDB();
      int rowsAffected = await db.insert(tableName, todoModel.toMap());
      return rowsAffected > 0;
    } catch (e) {
      if (kDebugMode) {
        print("Error in adding data: $e");
      }
      return false;
    }
  }

  ///Get All Data
  Future<List<TodoModel>> fetchAllData() async {
    try {
      Database db = await getDB();
      List<Map<String, dynamic>> data = await db.query(tableName);
      return data.map((todo) => TodoModel.fromMap(todo)).toList();
    } catch (e) {
      if (kDebugMode) {
        print("Error in fetching data: $e");
      }
    }
    return [];
  }

  ///Update Data
  Future<bool> updateData(TodoModel todoModel) async {
    try {
      Database db = await getDB();
      int rowsAffected = await db.update(
        tableName,
        todoModel.toMap(),
        where: "$columnId = ?",
        whereArgs: [todoModel.id],
      );
      return rowsAffected > 0;
    } catch (e) {
      if (kDebugMode) {
        print("Error in updating data: $e");
      }
    }
    return false;
  }

  ///Delete Data
  Future<bool> deleteData(int id) async {
    try {
      Database db = await getDB();
      int rowsAffected = await db.delete(tableName, where: "$columnId = $id");

      return rowsAffected > 0;
    } catch (e) {
      if (kDebugMode) {
        print("Error in deleting data: $e");
      }
    }
    return false;
  }
}
