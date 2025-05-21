import '../../model/todo_model.dart';

abstract class TodoBlocEvent {}

class TodoBlocLoadingEvent extends TodoBlocEvent {}

// class TodoBlocCompleteEvent extends TodoBlocEvent {
//   final bool isCompleted;
//   final int id;
//   TodoBlocCompleteEvent({required this.isCompleted, required this.id});
// }

class TodoBlocInitEvent extends TodoBlocEvent {}

class TodoBlocAddEvent extends TodoBlocEvent {
  final TodoModel newTodo;
  TodoBlocAddEvent({required this.newTodo});
}

class TodoBlocUpdateEvent extends TodoBlocEvent {
  final TodoModel updatedTodo;
  TodoBlocUpdateEvent({required this.updatedTodo});
}

class TodoBlocDeleteEvent extends TodoBlocEvent {
  final int id;
  TodoBlocDeleteEvent({required this.id});
}


class TodoBlocFilterChangedEvent extends TodoBlocEvent {
  final String newFilter;
  TodoBlocFilterChangedEvent({required this.newFilter});
}

class TodoBlocPriorityChangedEvent extends TodoBlocEvent {
  final String newPriority;
  TodoBlocPriorityChangedEvent({required this.newPriority});
}

class TodoBlocRefreshEvent extends TodoBlocEvent {}

