import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  static const String tableExpense ="expense";
  static const String tableUser ="user";

  /// user table columns
  static const String columnUserId= "user_id";
  static const String columnUserName= "user_name";
  static const String columnUserEmail= "user_email";
  static const String columnUserMobileNumber= "user_mob_no";

  /// expense table columns
  static const String columnExpenseId= "expense_id";
  static const String columnExpenseTitle= "expense_title";
  static const String columnExpenseDesc= "expense_description";
  static const String columnExpenseAmount= "expense_amount";
  static const String columnExpenseBalance= "expense_balance";
  static const String columnExpenseCategoryId= "expense_catId";
  static const String columnExpenseType= "expense_type";
  static const String columnCreatedAt= "created_at";


  DBHelper.internal();

  static final DBHelper _instance = DBHelper.internal();

  factory DBHelper() => _instance;

  Database? mDb;
  
  Future<Database> getDB() async{
    return mDb??= await _openDB();
  }
  
  Future<Database> _openDB() async{
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath= join(appDir.path, "todo.db");

    return await openDatabase(dbPath,version: 1,onCreate: (db,version) async{
    await db.execute('''
    
    ///User table
    CREATE TABLE $tableUser (
      $columnUserId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnUserName TEXT NOT NULL,
      $columnUserEmail TEXT,
      $columnUserMobileNumber TEXT
    )
    ''');

    ///Expense table
    await db.execute('''
    CREATE TABLE $tableExpense (
      $columnExpenseId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnUserId INTEGER,
      $columnExpenseTitle TEXT,
      $columnExpenseDesc TEXT,
      $columnExpenseAmount REAL,
      $columnExpenseBalance REAL,
      $columnExpenseCategoryId INTEGER,
      $columnExpenseType INTEGER,
      $columnCreatedAt TEXT
    )
    ''');
    });

    ///events
    ///createUser
    ///checkIfUserAlreadyExists
    ///authenticateUser
    ///addExpense
    ///fetchAllExpenses
    ///updateExpense
    ///deleteExpense
    
  }


}