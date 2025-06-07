import 'package:expense_app_bloc/core/models/expense_model.dart';

class FilteredExpModel{
  final String? title;
  final num bal;
  final List<ExpenseModel> allExp;

  FilteredExpModel({
    required this.title,
    required this.bal,
    required this.allExp,
  });
}