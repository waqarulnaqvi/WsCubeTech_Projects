

import 'package:expense_app_bloc/core/models/expense_model.dart';

abstract class ExpenseEvent {}


class ExpenseInitialEvent extends ExpenseEvent {
  final int filterType;
  ExpenseInitialEvent({
    required this.filterType,
  });

}

class AddingExpenseEvent extends ExpenseEvent {
   final ExpenseModel model;

  AddingExpenseEvent({
    required this.model,

  });
}

class UpdateExpenseEvent extends ExpenseEvent {
  final ExpenseModel model;


  UpdateExpenseEvent({
    required this.model,
  });
}

class DeleteExpenseEvent extends ExpenseEvent {
  final int expenseId;

  DeleteExpenseEvent({
    required this.expenseId,
  });
}

class GetAllExpensesEvent extends ExpenseEvent {}
