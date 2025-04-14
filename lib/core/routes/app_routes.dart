import 'package:chat_app_homework/core/routes/paths.dart';
import 'package:chat_app_homework/features/profile/view/pages/more_apps_page.dart';
import 'package:flutter/material.dart';
import '../../features/profile/view/pages/profile_page.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Paths.initial:
        return MaterialPageRoute(builder: (context) => ProfilePage());

      case Paths.moreAppsPage:
        return MaterialPageRoute(builder: (context) => MoreAppsPage());

       default:
        return MaterialPageRoute(builder: (context) => const ProfilePage());

    // case Paths.bottomNavBar:
    //   return MaterialPageRoute(builder: (context) => BottomNavBar());
    }
  }
}
