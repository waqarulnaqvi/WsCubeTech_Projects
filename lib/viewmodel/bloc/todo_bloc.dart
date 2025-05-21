import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/core/local/db_helper.dart';
import 'package:todo_app_bloc/viewmodel/bloc/todo_bloc_events.dart';
import 'package:todo_app_bloc/viewmodel/bloc/todo_bloc_state.dart';
import '../../model/todo_model.dart';
import '../../utils/filter_enum.dart';
import '../../utils/priority_type.dart';

class TodoBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  final DBHelper dbHelper;
  String currentFilter = FilterEnum.allTodos.value;
  String currentPriority = PriorityType.low.value;

  TodoBloc({required this.dbHelper}) : super(TodoBlocInitialState()) {
    /// Initial Data Load
    on<TodoBlocInitEvent>((event, emit) async {
      emit(TodoBlocLoadingState());
      await _fetchAndEmitFilteredData(emit);
    });

    /// Add Todo
    on<TodoBlocAddEvent>((event, emit) async {
      final success = await dbHelper.addData(event.newTodo);
      if (success) {
        await _fetchAndEmitFilteredData(emit);
      } else {
        emit(TodoBlocErrorState(errorMessage: "Error adding todo."));
      }
    });

    /// Update Todo
    on<TodoBlocUpdateEvent>((event, emit) async {
      final success = await dbHelper.updateData(event.updatedTodo);
      if (success) {
        await _fetchAndEmitFilteredData(emit);
      } else {
        emit(TodoBlocErrorState(errorMessage: "Error updating todo."));
      }
    });

    /// Delete Todo
    on<TodoBlocDeleteEvent>((event, emit) async {
      final success = await dbHelper.deleteData(event.id);
      if (success) {
        await _fetchAndEmitFilteredData(emit);
      } else {
        emit(TodoBlocErrorState(errorMessage: "Error deleting todo."));
      }
    });

    /// Filter Change
    on<TodoBlocFilterChangedEvent>((event, emit) async {
      if (currentFilter != event.newFilter) {
        currentFilter = event.newFilter;
        await _fetchAndEmitFilteredData(emit);
      }
    });

    /// Priority Change
    on<TodoBlocPriorityChangedEvent>((event, emit) async {
      if (currentPriority != event.newPriority) {
        currentPriority = event.newPriority;
        await _fetchAndEmitFilteredData(emit);
      }
    });

    /// Manual Refresh
    on<TodoBlocRefreshEvent>((event, emit) async {
      await _fetchAndEmitFilteredData(emit);
    });
  }

  /// Applies filter & priority, then emits state
  Future<void> _fetchAndEmitFilteredData(Emitter<TodoBlocState> emit) async {
    try {
      List<TodoModel> todoList = await dbHelper.fetchAllData();

      // Apply completion filter
      if (currentFilter == FilterEnum.completed.value) {
        todoList = todoList.where((e) => e.isCompleted == true).toList();
      } else if (currentFilter == FilterEnum.notCompleted.value) {
        todoList = todoList.where((e) => e.isCompleted == false).toList();
      }

      // Apply priority filter
      if (currentFilter == FilterEnum.highPriority.value) {
        todoList = todoList.where((e) => e.priority == PriorityType.high.intValue).toList();
      } else if (currentFilter == FilterEnum.mediumPriority.value) {
        todoList = todoList.where((e) => e.priority == PriorityType.medium.intValue).toList();
      } else if (currentFilter == FilterEnum.lowPriority.value) {
        todoList = todoList.where((e) => e.priority == PriorityType.low.intValue).toList();
      }

      // Reverse list for latest first
      todoList = todoList.reversed.toList();

      emit(TodoBlocLoadedState(todoList: todoList));
    } catch (e) {
      emit(TodoBlocErrorState(errorMessage: "Failed to load todos."));
    }
  }
}


// set changeFilter(String newFilter) {
//   if (currentFilter != newFilter) {
//     currentFilter = newFilter;
//     fetchData();
//   }
// }
//
// set changePriority(String newPriority) {
//   if (priority != newPriority) {
//     priority = newPriority;
//     fetchData();
//
//   }
// }
