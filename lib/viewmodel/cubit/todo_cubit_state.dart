
import 'package:todo_app_cubit/model/todo_model.dart';

abstract class TodoCubitState{
}

class TodoCubitLoadedState extends TodoCubitState{
  final List<TodoModel> todoList;
  TodoCubitLoadedState({required this.todoList });
}

class TodoCubitInitialState extends TodoCubitState{}

class TodoCubitLoadingState extends TodoCubitState{}

class TodoCubitErrorState extends TodoCubitState{
  final String errorMessage;
  TodoCubitErrorState({required this.errorMessage});
}

