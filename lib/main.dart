import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappclone/features/chats/presentation/pages/chats_page.dart';
import 'package:whatsappclone/features/communities/presentation/pages/communities_page.dart';
import 'package:whatsappclone/features/updates/presentation/pages/updates_page.dart';
import 'package:whatsappclone/shared/presentation/widget/bottom_nav_bar/bottom_nav_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Whats App Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BottomNavBar(),
    );
  }
}