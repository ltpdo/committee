import 'package:committee/screens/AccountScreen.dart';
import 'package:committee/screens/HomeScreen.dart';
import 'package:committee/screens/MessageScreen.dart';
import 'package:committee/screens/SearchScreen.dart';
import 'package:flutter/material.dart';

class MainPageState extends StatefulWidget {
  const MainPageState({Key? key}) : super(key: key);

  @override
  State<MainPageState> createState() => _MainPageState();
}

class _MainPageState extends State<MainPageState> {
  static const _screens = [
    HomeScreen(),
    SearchScreen(),
    MessageScreen(),
    AccountScreen(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム画面'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'メッセージ'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
          ],
          type: BottomNavigationBarType.fixed,
        ));
  }
}
