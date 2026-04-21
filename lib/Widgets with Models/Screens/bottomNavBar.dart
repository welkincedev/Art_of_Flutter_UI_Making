import 'package:flutter/material.dart';

class BotmNavBar extends StatefulWidget {
  const BotmNavBar({super.key});

  @override
  State<BotmNavBar> createState() => _BotmNavBarState();
}

class _BotmNavBarState extends State<BotmNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 10,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.green,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_rounded),label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.message),label: "Details"),
          BottomNavigationBarItem(icon: Icon(Icons.tab),label: "Tabs"),
        ],
      ),
    );
  }
}
