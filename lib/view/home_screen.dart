import 'package:committee/component/community_screen/communities_List/communitiesList_screen.dart';
import 'package:committee/component/home_screen_widget/belong_to_community_list/belong_to_community_list.dart';
import 'package:committee/component/home_screen_widget/create_community.dart';
import 'package:committee/component/home_screen_widget/recommended_community_list/recommendCommunityScreen.dart';
import 'package:committee/component/home_screen_widget/recommended_community_list/recommendedCommunity_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 28,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              children: [
                TextSpan(
                  text: 'コミティ',
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const WidgetSpan(
                  child: Icon(
                    Icons.supervised_user_circle_rounded,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const CreateCommunityScreen();
                    },
                  ),
                );
              },
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
                  const belongToCommunityList(),
                  SizedBox(height: 6),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const CommunitiesListScreen();
                          },
                        ),
                      );
                    },
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
                  RecommendedCommunityList(),
                  SizedBox(height: 6),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return RecommendCommunityScreen();
                          },
                        ),
                      );
                    },
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
