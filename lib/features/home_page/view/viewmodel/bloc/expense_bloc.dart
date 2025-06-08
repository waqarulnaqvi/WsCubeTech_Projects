import 'package:expense_app_bloc/core/constants/app_constants.dart';
import 'package:expense_app_bloc/core/local/db_helper.dart';
import 'package:expense_app_bloc/features/home_page/model/filtered_exp_model.dart';
import 'package:expense_app_bloc/features/home_page/view/viewmodel/bloc/expense_event.dart';
import 'package:expense_app_bloc/features/home_page/view/viewmodel/bloc/expense_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/models/expense_model.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  DBHelper dbHelper;

  List<FilteredExpModel> filterExpense(
      {required List<ExpenseModel> mExp, int filterType = 1}) {
    ///1 -> date , 2-> month 3-> year , 4 -> category

    ///date-wise

    List<FilteredExpModel> filteredExpenses = [];

    ///1 -> date , 2-> month 3-> year
    if (filterType < 4) {
      ///date-wise
      ///uniqueDates
      DateFormat df = DateFormat.yMMMEd();

      if (filterType == 1) {
        df = DateFormat.yMMMEd();

        ///date wise
      } else if (filterType == 2) {
        df = DateFormat.yMMM();

        ///month wise
      } else if (filterType == 3) {
        df = DateFormat.y();

        ///year wise
      }

      List<String> uniqueDates = [];

      for (ExpenseModel exp in mExp) {
        String eachDate = df.format(
            DateTime.fromMillisecondsSinceEpoch(int.parse(exp.createdAt)));
        if (!uniqueDates.contains(eachDate)) {
          uniqueDates.add(eachDate);
        }
      }
      // print("Unique Dates: $uniqueDates");
      for (String eachDate in uniqueDates) {
        num bal = 0.0;
        List<ExpenseModel> allExp = [];

        // print(
        //     "Processing date: $eachDate with balance: $bal and expenses: $allExp");

        for (ExpenseModel eachExp in mExp) {
          String expDate = df.format(DateTime.fromMillisecondsSinceEpoch(
              int.parse(eachExp.createdAt)));
          if (expDate == eachDate) {
            allExp.add(eachExp);
            if (eachExp.type == 1) {
              bal -= eachExp.amount;
            } else {
              bal += eachExp.amount;
            }
            // if (filterType == 1) {
            //   mExp.remove(eachExp); // remove to minimize processing
            // }
          }
        }

        filteredExpenses
            .add(FilteredExpModel(title: eachDate, bal: bal, allExp: allExp));

        /// remove from mExp to minimize processing
        // mExp.remove(expDate);
      }
    } else {
      ///sort by category
      for (Map<String, dynamic> eachCat in AppConstants.mCat) {
        num bal = 0.0;
        // int count = 0;
        List<ExpenseModel> eachCatExp = [];

        for (ExpenseModel eachExp in mExp) {
          if (eachExp.categoryId == eachCat['catId']) {
            // count++;
            eachCatExp.add(eachExp);
            if (eachExp.type == 1) {
              bal -= eachExp.amount;
            } else {
              bal += eachExp.amount;
            }
          }
        }

        if (eachCatExp.isNotEmpty) {
          // if (count > 0) {
          filteredExpenses.add(FilteredExpModel(
              title: eachCat['catName'], bal: bal, allExp: eachCatExp));
        }
      }
    }

    return filteredExpenses;
  }

  ExpenseBloc({required this.dbHelper}) : super(ExpenseInitialState()) {
    on<ExpenseInitialEvent>((event, emit) async {
      emit(ExpenseLoadingState());

      List<ExpenseModel> expenses = await dbHelper.fetchAllExpenses();
      if (expenses.isNotEmpty) {
        emit(ExpenseSuccessState(
            totalBalance: expenses.fold(
                0,
                (sum, item) =>
                    sum + (item.type == 1 ? -item.amount : item.amount)),
            mExpenses:
                filterExpense(mExp: expenses, filterType: event.filterType)));
      } else {
        emit(ExpenseFailureState(error: "No expenses found"));
      }
    });

    on<AddingExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());

      bool isAdded = await dbHelper.addExpense(expense: event.model);
      if (isAdded) {
        List<ExpenseModel> expenses = await dbHelper.fetchAllExpenses();
        emit(ExpenseSuccessState(
            totalBalance: expenses.fold(
                0,
                (sum, item) =>
                    sum + (item.type == 1 ? -item.amount : item.amount)),
            mExpenses: filterExpense(
              mExp: expenses,
            )));
      } else {
        emit(ExpenseFailureState(error: "Failed to add expense"));
      }
    });

    on<UpdateExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());

      bool isUpdated = await dbHelper.updateExpense(expense: event.model);
      if (isUpdated) {
        List<ExpenseModel> expenses = await dbHelper.fetchAllExpenses();
        emit(ExpenseSuccessState(
            totalBalance: expenses.fold(
                0,
                (sum, item) =>
                    sum + (item.type == 1 ? -item.amount : item.amount)),
            mExpenses: filterExpense(mExp: expenses)));
      } else {
        emit(ExpenseFailureState(error: "Failed to update expense"));
      }
    });

    on<DeleteExpenseEvent>((event, emit) async {
      emit(ExpenseLoadingState());

      bool isDeleted = await dbHelper.deleteExpense(expenseId: event.expenseId);
      if (isDeleted) {
        List<ExpenseModel> expenses = await dbHelper.fetchAllExpenses();
        emit(ExpenseSuccessState(
            totalBalance: expenses.fold(
                0,
                (sum, item) =>
                    sum + (item.type == 1 ? -item.amount : item.amount)),
            mExpenses: filterExpense(mExp: expenses)));
      } else {
        emit(ExpenseFailureState(error: "Failed to delete expense"));
      }
    });
  }
}
