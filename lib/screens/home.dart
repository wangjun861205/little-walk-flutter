import 'package:flutter/material.dart';
import 'package:little_walk/screens/profile_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final pages = [
    const ProfileMenuScreen(),
    const ProfileMenuScreen(),
    const ProfileMenuScreen(),
    const ProfileMenuScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.amber[400]), label: "首页"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.handshake,
                  color: Colors.amber[400],
                ),
                label: "代遛"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports,
                  color: Colors.amber[400],
                ),
                label: "邀请"),
            BottomNavigationBarItem(
                icon: Icon(
                  color: Colors.amber[400],
                  Icons.portrait,
                ),
                label: "个人"),
          ],
          selectedItemColor: Colors.amber[800],
          currentIndex: selectedIndex,
          onTap: (idx) {
            setState(() => selectedIndex = idx);
          }),
    );
  }
}
