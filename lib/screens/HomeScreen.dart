import 'package:committee/data/dummy_data.dart';
import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';
import 'package:committee/screens/SearchScreen.dart';
import 'package:committee/screens/MessageScreen.dart';
import 'package:committee/screens/AccountScreen.dart';
import 'package:committee/HomeScreen_widget/belongToCommunityList/belongToCommunity_list.dart';
import 'package:committee/BottomNavigationBar/mainPageState.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('コミティ'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              color: Colors.red,
              height: 265,
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Title(
                    color: Colors.black,
                    child: Text(
                      '所属しているコミュニティ',
                    ),
                  ),
                  SizedBox(height: 20),
                  belongToCommunityList(communities: dummy_community),
                  SizedBox(height: 6),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('もっと見る'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Container(
              color: Colors.blue,
              height: 265,
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Title(
                    color: Colors.black,
                    child: Text(
                      'おすすめのコミュニティ',
                    ),
                  ),
                  SizedBox(height: 20),
                  belongToCommunityList(communities: dummy_community),
                  SizedBox(height: 6),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('もっと見る'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
