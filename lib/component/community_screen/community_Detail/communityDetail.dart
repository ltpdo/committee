import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';

class CommunityDetailScreen extends StatelessWidget {
  const CommunityDetailScreen({super.key, required this.community});

  final Community community;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('コミュニティ詳細'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('コミュニティ名: ${community.name}'),
            Text('日時: ${community.activityTime}'),
            Text('場所: ${community.location}'),
            // 他の詳細情報を表示する
          ],
        ),
      ),
    );
  }
}
