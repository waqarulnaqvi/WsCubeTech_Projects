import 'package:flutter/material.dart';
import 'package:whatsappclone/core/theme/app_color.dart';
import 'package:whatsappclone/features/calls/presentation/pages/calls_page.dart';
import 'package:whatsappclone/features/chats/presentation/pages/chats_page.dart';
import 'package:whatsappclone/features/communities/presentation/pages/communities_page.dart';
import 'package:whatsappclone/features/updates/presentation/pages/updates_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    ChatsPage(),
    UpdatesPage(),
    CommunitiesPage(),
    CallsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: _screens[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: BottomNavigationBar(items: [
            BottomNavigationBarItem(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
          decoration: BoxDecoration(
            color: _selectedIndex==0? Colors.green.shade100 :Colors.transparent, // Light green background
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.chat, color: _selectedIndex==0? AppColor.themeColor :Colors.black87),
                ),
                    Positioned(
                      top: 1,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 20,
                          minHeight: 14,
                        ),
                        child: Text(
                          "38",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              label: "Chats",
            ),
            _buildNavItem(Icons.update, Icons.update_outlined, "Updates", 1),
            _buildNavItem(Icons.group, Icons.group_outlined, "Communities", 2),
            _buildNavItem(Icons.call, Icons.call_outlined, "Calls", 3),
          ],
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,

            currentIndex: _selectedIndex,
            onTap: (index){
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedIconTheme: IconThemeData(color: AppColor.themeColor),
            unselectedLabelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w200,height: 2.0),
            unselectedItemColor: Colors.black87,
            selectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black,height: 2.0),
          ),
        ),
      ),

    );
  }

  BottomNavigationBarItem _buildNavItem(IconData selectedIcon, IconData unselectedIcon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon:  Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected==true? Colors.green.shade100 :Colors.transparent, // Light green background
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(selectedIcon, color: isSelected==true? AppColor.themeColor :Colors.black87),
      )
      ,
      label: label,
    );
  }

}
