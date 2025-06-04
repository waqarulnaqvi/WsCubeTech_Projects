import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../models/expense_model.dart';
import '../models/user_model.dart';

class DBHelper {
  static const String tableExpense = "expense";
  static const String tableUser = "user";

  /// user table columns
  static const String columnUserId = "user_id";
  static const String columnUserName = "user_name";
  static const String columnUserEmail = "user_email";
  static const String columnUserMobileNumber = "user_mob_no";
  static const String columnUserPassword = "user_password";

  /// expense table columns
  static const String columnExpenseId = "expense_id";
  static const String columnExpenseTitle = "expense_title";
  static const String columnExpenseDesc = "expense_description";
  static const String columnExpenseAmount = "expense_amount";
  static const String columnExpenseBalance = "expense_balance";
  static const String columnExpenseCategoryId = "expense_catId";
  static const String columnExpenseType = "expense_type";
  static const String columnCreatedAt = "created_at";

  DBHelper.internal();

  static final DBHelper _instance = DBHelper.internal();

  factory DBHelper() => _instance;

  Database? mDb;

  Future<Database> getDB() async {
    return mDb ??= await _openDB();
  }

  Future<Database> _openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "todo.db");

    return await openDatabase(dbPath, version: 1,
        onCreate: (db, version) async {
      // Creating User table
      await db.execute('''
      CREATE TABLE $tableUser (
        $columnUserId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnUserName TEXT NOT NULL,
        $columnUserEmail TEXT,
        $columnUserMobileNumber TEXT,
        $columnUserPassword TEXT NOT NULL
      )
    ''');

      // Creating Expense table
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
  }

  ///events
  ///createUser
  Future<bool> createUser({required UserModel user}) async {
    var db = await getDB();
    int rowsAffected = await db.insert(tableUser, user.toJson());
    return rowsAffected > 0;
  }

  ///checkIfUserAlreadyExists
  Future<bool> checkIfUserAlreadyExists({required final String email}) async {
    var db = await getDB();
    List<Map<String, dynamic>> data = await db
        .query(tableUser, where: "$columnUserEmail = ?", whereArgs: [email]);
    return data.isNotEmpty;
  }

  ///authenticateUser
  Future<UserModel?> authenticateUser(
      {required String email, required String password}) async {
    bool userExisted =
        await checkIfUserAlreadyExists(email: email) ? true : false;

    if (userExisted) {
      var db = await getDB();
      List<Map<String, dynamic>> data = await db.query(tableUser,
          where: "$columnUserEmail = ? AND $columnUserPassword = ?",
          whereArgs: [email, password]);

      // print("Data fetched: $data");

      if (data.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('userId', data[0][columnUserId] as int);

        return UserModel.fromJson(data.first);

        // return data.map((e) => UserModel.fromJson(e)).first;
      }
    }

    return null;
  }

  Future<UserModel> getUserByEmail({required String email}) async {
    var db = await getDB();
    List<Map<String, dynamic>> data = await db
        .query(tableUser, where: "$columnUserEmail = ?", whereArgs: [email]);
    if (data.isNotEmpty) {
      return UserModel.fromJson(data.first);
    } else {
      throw Exception("User not found");
    }
  }

  ///addExpense
  Future<bool> addExpense({required ExpenseModel expense}) async {
    var db = await getDB();

    //get userId from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId')!;
    expense.userId = userId;

    int rowsAffected = await db.insert(tableExpense, expense.toMap());
    return rowsAffected > 0;
  }

  ///fetchAllExpenses
  Future<List<ExpenseModel>> fetchAllExpenses() async {
    var db = await getDB();

    //get userId from shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('userId')!;
    List<Map<String, dynamic>> data =
        await db.query(tableExpense, where: "$columnUserId = $userId");

    if (data.isNotEmpty) {
      return data.map((e) => ExpenseModel.fromMap(e)).toList();
    } else {
      return [];
    }
  }

  ///updateExpense
  ///deleteExpense
}
