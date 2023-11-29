import 'package:committee/component/community_screen/communities_List/communitiesList.dart';
import 'package:flutter/material.dart';

class CommunitiesListScreen extends StatelessWidget {
  const CommunitiesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('所属しているコミュニティ'),
        ),
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(31, 199, 9, 9),
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
                  const CommunitiesList(),
                  const SizedBox(height: 6),
                ],
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
