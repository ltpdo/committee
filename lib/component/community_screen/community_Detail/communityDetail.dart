import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:committee/models/community.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CommunityDetailScreen extends StatelessWidget {
  const CommunityDetailScreen({super.key, required this.community});

  final Community community;

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    bool isMember = community.members!.contains(authenticatedUser.uid);

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

            isMember
                ? const ElevatedButton(
                    onPressed: null, child: const Text('参加しています'))
                : ElevatedButton(
                    onPressed: () {
                      joinCommunity(authenticatedUser.uid);
                    },
                    child: const Text('参加する')),
          ],
        ),
      ),
    );
  }

  Future<void> joinCommunity(String userId) async {
    try {
      // FirestoreのcommunityドキュメントのmembersフィールドにユーザーのUIDを追加
      await FirebaseFirestore.instance
          .collection('community')
          .doc(community.circleId)
          .update({
        'members': FieldValue.arrayUnion([userId])
      });
    } catch (e) {
      print('エラー: $e');
    }
  }
}
