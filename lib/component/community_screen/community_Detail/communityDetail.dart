import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:committee/models/community.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CommunityDetailScreen extends StatelessWidget {
  const CommunityDetailScreen({super.key, required this.community});

  final Community community;

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    bool isMember = community.members!.contains(authenticatedUser.uid);
    bool isrepresentative =
        community.representative?.contains(authenticatedUser.uid) ?? false;
    bool isButtonPressed = true;

    List<String>? membersId = community.members;
    List<String>? representativeId = community.representative;

    return Scaffold(
      backgroundColor: const Color.fromARGB(197, 215, 172, 206),
      appBar: AppBar(
        title: const Text('コミュニティ詳細'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              //写真　サイズはご自由に
              height: 300,
              width: 500,
              color: Colors.amber,
              margin: const EdgeInsets.all(10),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'コミュニティ名',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 149, 40, 118),
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    ' ${community.name}',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const SizedBox(height: 10),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '活動内容',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 149, 40, 118),
                        width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    ' ${community.content}',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Center(
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '活動時間:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(' ${community.activityTime}'),
                      const SizedBox(width: 20),
                      const Text(
                        '場所: ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('${community.location}'),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              alignment: Alignment.centerLeft,
              child: const Text(
                'メンバーリスト',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),

            //Text('メンバーID: ${community.members}'),
            //Text('代表メンバーID: ${community.representative}'),
            //Text('isrepresentaitive: $isrepresentative'),

            FutureBuilder<List<String>>(
              future: getMemberNames(membersId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('エラー: ${snapshot.error}');
                } else {
                  List<String> memberNames = snapshot.data!;
                  return Column(
                    children: [
                      for (int i = 0; i < memberNames.length; i++)
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 35,
                                ),
                                child: Text(
                                  '・ ${memberNames[i]}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            if (isrepresentative &&
                                !representativeId!.contains(membersId![i]))
                              ElevatedButton(
                                onPressed: isButtonPressed
                                    ? () {
                                        _addRepresentative(
                                          membersId[i],
                                        );
                                      }
                                    : null,
                                child: const Text('代表メンバーにする'),
                              ),
                          ],
                        ),
                    ],
                  );
                }
              },
            ),
            // メンバー名を表示する
            isMember
                ? const ElevatedButton(
                    onPressed: null,
                    child: Text('参加しています'),
                  )
                : ElevatedButton(
                    onPressed: () {
                      joinCommunity(authenticatedUser.uid);
                    },
                    child: const Text('参加する'),
                  ),
          ],
        ),
      ),
    );
  }

  Future<List<String>> getMemberNames(List<String>? memberIds) async {
    List<String> memberNames = [];

    if (memberIds != null) {
      for (String memberId in memberIds) {
        QuerySnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('user')
            .where('uid', isEqualTo: memberId)
            .get();

        if (userSnapshot.docs.isNotEmpty) {
          String userName = userSnapshot.docs[0]['name'];
          print('User ID: $memberId, User Name: $userName');
          memberNames.add(userName);
        } else {
          print('User ID: $memberId does not exist');
        }
      }
    }

    return memberNames;
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

  Future<void> _addRepresentative(String membersId) async {
    try {
      await FirebaseFirestore.instance
          .collection('community')
          .doc(community.circleId) // ここにコミュニティのドキュメントIDを指定
          .update({
        'representaitive': FieldValue.arrayUnion([membersId])
      });
      print('代表メンバーになりました: ${'membersID'}');
    } catch (e) {
      print('エラー: $e');
    }
  }
}
