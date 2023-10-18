import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../component/message_screen_widget/chat_list/chat_list_list.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    String _authUid = authenticatedUser.uid;

    return Scaffold(
      appBar: AppBar(
        title: Text('メッセージ'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('community')
            .where('members', arrayContains: _authUid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Container(
              width: double.infinity,
              child: Center(
                child: Text('所属しているコミュニティはありません'),
              ),
            );
          }

          // snapshotからコミュニティのリストを作成
          List<Community> communityList =
              snapshot.data!.docs.map((DocumentSnapshot doc) {
            Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
            return Community(
              // コミュニティのデータを取得してCommunityオブジェクトに変換
              // 必要に応じてCommunityモデルのコンストラクタを変更してください
              circleId: doc.id,
              name: data['name'],
            );
          }).toList();

          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: TolkList(
                    interlocuter: communityList,
                    onRemoveTolk: (community) {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
