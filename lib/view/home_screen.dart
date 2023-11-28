import 'package:committee/component/community_screen/communities_List/communitiesList_screen.dart';
import 'package:committee/component/home_screen_widget/belong_to_community_list/belong_to_community_list.dart';
import 'package:committee/component/home_screen_widget/create_community.dart';
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
        backgroundColor: const Color.fromARGB(31, 199, 9, 9),
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
                    Icons.groups,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 265,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Title(
                      color: Colors.black,
                      child: const Text(
                        '所属しているコミュニティ',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const belongToCommunityList(),
                    const SizedBox(height: 6),
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
                      child: const Text('もっと見る'),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  // 枠線
                  border: Border.all(
                    color: const Color.fromARGB(255, 2, 2, 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  const SizedBox(height: 1),
                  Title(
                    color: Colors.black,
                    child: const Text(
                      'おすすめのコミュニティ',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const RecommendedCommunityList(),
                  const SizedBox(height: 6),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
