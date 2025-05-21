import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/view/widgets/containers/reusable_folded_corner_container.dart';
import 'package:todo_app_bloc/view/widgets/global_widgets.dart';
import 'package:todo_app_bloc/viewmodel/bloc/todo_bloc.dart';
import 'package:todo_app_bloc/viewmodel/bloc/todo_bloc_events.dart';
import 'package:todo_app_bloc/viewmodel/bloc/todo_bloc_state.dart';
import '../../utils/filter_enum.dart';
import '../widgets/button/custom_drop_down_button.dart';
import 'add_content_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoBlocInitEvent());
    // context.read<TodoCubit>().init();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Todo Bloc'), centerTitle: true),

      body: BlocBuilder<TodoBloc, TodoBlocState>(
        builder: (context, state) {
          if (state is TodoBlocLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoBlocErrorState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is TodoBlocLoadedState) {
            final todoList = state.todoList;
            return Column(
              children: [
                spacerH(10),
                CustomDropDownButton(
                  heading: context.watch<TodoBloc>().currentFilter,
                  onChanged: (cValue) {
                    if (cValue != null) {
                      context.read<TodoBloc>().add(TodoBlocFilterChangedEvent(
                        newFilter: cValue,
                      ));

                      // context.read<TodoCubit>().changeFilter = index;
                      // rCubit.changeFilter = index;
                      // rCubit.changeFilter = FilterEnum.values[index].value;
                    }
                  },
                  categories: FilterEnum.values.map((e) => e.value).toList(),
                ),
                spacerH(10),

                Expanded(
                  child:
                      todoList.isEmpty
                          ? const Center(child: Text('No Todos Content'))
                          : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 40),
                            itemBuilder: (context, index) {
                              final todo = todoList[index];
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  top: 15,
                                ),
                                child: ReusableFoldedCornerContainer(
                                  todoModel: todo,
                                ),
                              );
                            },
                            itemCount: todoList.length,
                          ),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No Todos'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<TodoCubit>().addData(
          //   TodoModel(
          //     title: 'New Todo',
          //     description: 'Description of new todo',
          //     priority: 0,
          //     isCompleted: true,
          //   ),
          // );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddContentPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_app_bloc/model/todo_model.dart';
// import '../../viewmodel/cubit/todo_cubit.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<TodoCubit>().fetchData(); // Load todos when screen opens
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Todo Cubit')),
//       body: BlocBuilder<TodoCubit, List<TodoModel>>(
//         builder: (context, todoList) {
//           if (todoList.isEmpty) {
//             return const Center(child: Text('No Todos'));
//           }
//
//           return ListView.builder(
//             itemCount: todoList.length,
//             itemBuilder: (context, index) {
//               final todo = todoList[index];
//
//               return RadioListTile<bool>(
//                 value: true,
//                 groupValue: todo.isCompleted,
//                 onChanged: (value) {
//                   context.read<TodoCubit>().updateData(
//                     TodoModel(
//                       id: todo.id, // Important for update
//                       title: todo.title,
//                       description: todo.description,
//                       priority: todo.priority,
//                       isCompleted: value ?? false,
//                     ),
//                   );
//                 },
//                 title: Text(todo.title),
//                 subtitle: Text(todo.description),
//                 secondary: IconButton(
//                   icon: const Icon(Icons.delete, color: Colors.red),
//                   onPressed: () {
//                     context.read<TodoCubit>().deleteData(todo.id!);
//                   },
//                 ),
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           context.read<TodoCubit>().addData(
//             TodoModel(
//               title: 'New Todo',
//               description: 'Description of new todo',
//               priority: 1,
//               isCompleted: false,
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:todo_app_bloc/core/local/db_helper.dart';
// // import 'package:todo_app_bloc/model/todo_model.dart';
// //
// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   List<TodoModel> list = [];
// //   DBHelper? dbHelper;
// //   bool isCompleted = false;
// //   @override
// //   void initState() {
// //     super.initState();
// //     dbHelper = DBHelper();
// //     fetchData();
// //   }
// //
// //   Future<void> fetchData() async {
// //     list = await dbHelper!.fetchAllData();
// //     setState(() {});
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Todo Cubit')),
// //       body: ListView.builder(
// //         itemCount: list.length,
// //         itemBuilder: (context, index) {
// //           var todo = list[index];
// //           return RadioListTile(
// //             value: todo.isCompleted,
// //             groupValue: isCompleted,
// //             onChanged: (value) {
// //               setState(() {
// //                 isCompleted = value!;
// //                 dbHelper!.updateData(TodoModel(title: todo.title, description: todo.description, priority: todo.priority, isCompleted: isCompleted));
// //               });
// //             },
// //             title: Text(todo.title),
// //             subtitle: Text(todo.description),
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           dbHelper!.addData(
// //             TodoModel(
// //               title: 'New Todo',
// //               description: 'Description of new todo',
// //               priority: 1,
// //               isCompleted: false,
// //             ),
// //           );
// //           fetchData();
// //           // Add your action here
// //         },
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
