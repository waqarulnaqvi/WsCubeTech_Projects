
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
  final double totalBalance;

  const ExpenseSuccessState({required this.mExpenses,required this.totalBalance});
}

class ExpenseFailureState extends ExpenseState {
  final String error;

  const ExpenseFailureState({required this.error});
}