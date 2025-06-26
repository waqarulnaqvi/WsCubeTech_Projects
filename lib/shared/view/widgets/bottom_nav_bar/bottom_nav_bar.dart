import 'package:flutter/material.dart';
import 'package:wallpaper_app_ui_homework/features/view/pages/nature.dart';
import 'package:wallpaper_app_ui_homework/features/view/pages/show_wallpaper.dart';
import 'package:wallpaper_app_ui_homework/features/view/pages/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
 List<Widget> bottomNav=[
   HomePage(),
   ShowWallpaper(),
   Nature(),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd7ebed),

      body: IndexedStack(
        index: _selectedIndex,
        children: bottomNav,
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.download), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepPurpleAccent,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      iconSize: 30,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      onTap: (index){
        setState(() {
          _selectedIndex = index;
        });
      },
      ),
    );
  }
}
