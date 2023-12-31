import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:committee/component/home_screen_widget/belong_to_community_list/belong_to_community_item.dart';
import 'package:committee/models/community.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CommunitiesList extends StatelessWidget {
  const CommunitiesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    String _authUid = authenticatedUser.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('community')
          .where('members', arrayContains: _authUid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Container(
            width: double.infinity,
            child: const Center(
              child: Text('所属しているコミュニティはありません'),
            ),
          );
        }

        // snapshotからコミュニティのリストを作成
        List<Community> communityList =
            snapshot.data!.docs.map((DocumentSnapshot doc) {
          Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
          List<String> members = (data['members'] as List<dynamic>?)
                  ?.map((memberData) => memberData.toString())
                  .toList() ??
              [];
          return Community(
            circleId: doc.id,
            name: data['name'],
            content: data['content'],
            activityTime: data['activityTime'],
            location: data['location'],
            url: "abc",
            picture: "",
            members: members,
            /*
            tags: data['tags'],
            
            
            
            representative: data['members'],
            */
          );
        }).toList();

        print(communityList.length);

        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 600,
              child: ListView.builder(
                itemCount: communityList.length,
                itemBuilder: (context, index) {
                  return BelongToCommunityItem(
                    communities: communityList,
                    index: index,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
