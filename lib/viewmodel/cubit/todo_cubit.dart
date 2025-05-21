import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit/core/local/db_helper.dart';
import 'package:todo_app_cubit/model/todo_model.dart';
import 'package:todo_app_cubit/utils/filter_enum.dart';
import 'package:todo_app_cubit/utils/priority_type.dart';
import 'package:todo_app_cubit/viewmodel/cubit/todo_cubit_state.dart';

class TodoCubit extends Cubit<TodoCubitState> {
  TodoCubit() : super(TodoCubitInitialState());
  final DBHelper dbHelper = DBHelper();
  String currentFilter= FilterEnum.values[0].value;
  String priority= PriorityType.values[0].value;

  set changeFilter(String newFilter) {
    if (currentFilter != newFilter) {
      currentFilter = newFilter;
     fetchData();
    }
  }

  set changePriority(String newPriority) {
    if (priority != newPriority) {
      priority = newPriority;
      fetchData();

    }
  }

  Future<void> init() async {
    if(state is TodoCubitInitialState) {
      emit(TodoCubitLoadingState());
    }
    List<TodoModel> todoList = await dbHelper.fetchAllData();
    todoList = todoList.reversed.toList();
    emit(TodoCubitLoadedState(todoList: todoList));
  }


  Future<void> fetchData() async {
    List<TodoModel> todoList = await dbHelper.fetchAllData();
    if(currentFilter == FilterEnum.allTodos.value)
      {
        todoList= todoList.reversed.toList();
      }
    else if(currentFilter == FilterEnum.completed.value)
      {
       todoList= todoList.where((e) => e.isCompleted == true).toList();
      }
    else if(currentFilter == FilterEnum.notCompleted.value)
      {
        todoList=  todoList.where((e) => e.isCompleted == false).toList();
      }
    else if(currentFilter == FilterEnum.highPriority.value)
      {
        todoList=  todoList.where((e) => e.priority == PriorityType.high.intValue).toList();

        // todoList.sort((a, b) => a.priority.compareTo(b.priority));
      }
    else if(currentFilter == FilterEnum.mediumPriority.value)
      {
       todoList = todoList.where((e) => e.priority == PriorityType.medium.intValue).toList();

      }
    else if(currentFilter == FilterEnum.lowPriority.value)
      {
        todoList = todoList.where((e) => e.priority == PriorityType.low.intValue).toList();

      }
    emit(TodoCubitLoadedState(todoList: todoList)); // emits updated list
  }

  Future<void> addData(TodoModel todoModel) async {
    await dbHelper.addData(todoModel);
    await fetchData(); // emits updated list
  }

  Future<void> updateData(TodoModel todoModel) async {
    await dbHelper.updateData(todoModel);
    await fetchData(); // emits updated list
  }

  Future<void> deleteData(int id) async {
    await dbHelper.deleteData(id);
    await fetchData(); // emits updated list
  }
}