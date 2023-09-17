import 'package:committee/data/dummy_data.dart';
import 'package:committee/models/community.dart';
import 'package:committee/view/account_screen.dart';
import 'package:committee/view/message_screen.dart';
import 'package:committee/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:committee/component/home_screen_widget/belong_to_community_list/belong_to_community_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
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
      ),
    );
  }
}
