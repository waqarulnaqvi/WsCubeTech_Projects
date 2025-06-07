import 'package:expense_app_bloc/core/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/local/db_helper.dart';
import 'features/authentication/viewmodel/bloc/user_bloc.dart';
import 'features/home_page/view/viewmodel/bloc/expense_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => UserBloc(dbHelper: DBHelper())),
    BlocProvider(create: (_) => ExpenseBloc(dbHelper: DBHelper())),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.firstPageRoute,
      routes: AppRoutes.mRoutes,
      // home: OnboardingPage(),
    );
  }
}
