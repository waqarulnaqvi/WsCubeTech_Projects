

import 'package:expense_app_bloc/features/home_page/view/widgets/bottom_navigation/bottom_nav_bar.dart';
import 'package:expense_app_bloc/features/splash_and_onboarding/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';
import '../features/authentication/pages/login_page.dart';
import '../features/authentication/pages/sign_up_page.dart';
import '../features/home_page/view/pages/add_expense_page.dart';
import '../features/home_page/view/pages/home_page.dart';

class AppRoutes{
  static const splashPageRoute ='/';
  static const homePageRoute = '/home';
  static const dashboardPageRoute = '/dashboard';
  static const firstPageRoute = '/first';
  static const welcomePageRoute = '/welcome';
  static const loginPageRoute = '/login';
  static const signUpPageRoute = '/signup';
  static const addExpensePageRoute = '/expense';
  static const bottomNavBar = '/bottomNavBar';

  static Map<String , Widget Function(BuildContext)> mRoutes ={
   // splashPageRoute: (context) => const SplashPage(),
    homePageRoute: (context) => const HomePage(),
   //  dashboardPageRoute: (context) => const DashboardPage(),
   //  firstPageRoute: (context) => const OnboardingPage(),
    firstPageRoute: (context) => const SplashPage(),
    bottomNavBar: (context) => const BottomNavBar(),
   //  welcomePageRoute: (context) => const WelcomePage(),
    loginPageRoute: (context) => const LoginPage(),
    signUpPageRoute: (context) => const SignUpPage(),
    addExpensePageRoute: (context) => const AddExpensePage(),
  };




}