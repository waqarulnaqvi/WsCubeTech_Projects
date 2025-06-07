import 'package:expense_app_bloc/core/local/db_helper.dart';

class ExpenseModel{
  final int? expenseId;
   int? userId;
  final String title;
  final String description;
  final double amount;
  final double balance;
  final int categoryId;
  final int type;
  final String createdAt;

  ExpenseModel({
   this.userId,
    this.expenseId,
    required this.title,
    required this.description,
    required this.amount,
    required this.balance,
    required this.categoryId,
    required this.type,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      // DBHelper.columnExpenseId: id,
      DBHelper.columnUserId: userId,
      DBHelper.columnExpenseTitle: title,
      DBHelper.columnExpenseAmount: amount,
      DBHelper.columnExpenseBalance: balance,
      DBHelper.columnExpenseDesc: description,
      DBHelper.columnExpenseCategoryId: categoryId,
      DBHelper.columnExpenseType: type,
      DBHelper.columnCreatedAt: createdAt,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      userId: map[DBHelper.columnExpenseId] as int?,
      expenseId: map[DBHelper.columnExpenseId] as int?,
      title: map[DBHelper.columnExpenseTitle] ?? '',
      amount: map[DBHelper.columnExpenseAmount] ?? 0.0,
      balance: map[DBHelper.columnExpenseBalance] ?? 0.0,
      categoryId: map[DBHelper.columnExpenseCategoryId] ?? 0,
      description: map[DBHelper.columnExpenseDesc] ?? '',
      type: map[DBHelper.columnExpenseType] ?? 0,
      createdAt: map[DBHelper.columnCreatedAt] ?? '',
    );
  }
}