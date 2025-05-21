import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/core/local/db_helper.dart';
import 'package:todo_app_bloc/view/pages/home_page.dart';
import 'package:todo_app_bloc/viewmodel/bloc/todo_bloc.dart';

void main() {
  runApp(BlocProvider(create: (_) => TodoBloc(dbHelper: DBHelper()), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Cubit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
