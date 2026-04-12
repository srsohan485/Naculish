import 'package:flutter/material.dart';


import '../../Features/AppUILightMode/Home/HomeMapScreen.dart';
import '../../Features/AppUILightMode/Leaderboard/LeaderboardScreen.dart';
import '../../Features/AppUILightMode/Profile/ProfileScreen.dart';
import '../../Features/AppUILightMode/Quest/QuestMenuScreen.dart';
import '../../Features/AppUILightMode/Shop/ShopScreen.dart';
import '../../Features/AppUILightMode/Speak/SpeakScreen.dart';
import 'BottomNavBar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeMapScreen(),
    SpeakScreen(),
    LeaderboardScreen(),
    QuestMenuScreen(),
    ShopScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
     bottomNavigationBar: MainBottomNavBar(
        selectedIndex: _selectedIndex,
         onTap: (index) {
           setState(() {
             _selectedIndex = index;
           });
         },
      ),
    );
  }
}