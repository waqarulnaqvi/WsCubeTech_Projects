

import 'package:expense_app_bloc/core/models/expense_model.dart';
import 'package:expense_app_bloc/features/home_page/model/filtered_exp_model.dart';

abstract class ExpenseState {
  const ExpenseState();}

class ExpenseInitialState extends ExpenseState {
}

class ExpenseLoadingState extends ExpenseState {
  const ExpenseLoadingState();
}

class ExpenseSuccessState extends ExpenseState {
  final List<FilteredExpModel> mExpenses;

  const ExpenseSuccessState({required this.mExpenses });
}

class ExpenseFailureState extends ExpenseState {
  final String error;

  const ExpenseFailureState({required this.error});
}