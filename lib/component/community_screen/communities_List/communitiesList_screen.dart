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
              color: Colors.red,
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
                  CommunitiesList(),
                  SizedBox(height: 6),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
