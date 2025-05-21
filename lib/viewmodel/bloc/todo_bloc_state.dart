import '../../model/todo_model.dart';

abstract class TodoBlocState {}

class TodoBlocInitialState extends TodoBlocState {}

class TodoBlocLoadingState extends TodoBlocState {}

class TodoBlocLoadedState extends TodoBlocState {
  final List<TodoModel> todoList;
  TodoBlocLoadedState({required this.todoList});
}

class TodoBlocErrorState extends TodoBlocState {
  final String errorMessage;
  TodoBlocErrorState({required this.errorMessage});
}