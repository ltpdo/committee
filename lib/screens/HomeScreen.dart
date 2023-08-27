import 'package:flutter/material.dart';
import 'package:committee/screens/SearchScreen.dart';
import 'package:committee/screens/MessageScreen.dart';
import 'package:committee/screens/AccountScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        print(index);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SearchScreen();
        }));
      } else if (index == 2) {
        print(index);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MessageScreen();
        }));
      } else if (index == 3) {
        print(index);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AccountScreen();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('コミティ'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム画面'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '検索'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'メッセージ'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
