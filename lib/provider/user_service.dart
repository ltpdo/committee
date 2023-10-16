import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:committee/models/community.dart';
import 'package:committee/models/tag.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userServiceProvider = Provider((ref) {
  return UserService();
});

class UserService {
  List<Community> communities = [];
//タグを登録する
  Future<void> registerTags(List<Tag> userTags) async {
    //現在ログインしているユーザーのユーザーIDを取得する
    final String? uuid = FirebaseAuth.instance.currentUser?.uid.toString();
    //データベースからユーザーIDを探す
    final doc = FirebaseFirestore.instance.collection('user').doc(uuid);
    try {
      //データベースに'tag'というフィールドを作ってその中にuserTagsの中身を入れる
      await doc.update({
        'tag': [
          for (Tag tag in userTags) ...{tag.name}
        ]
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchCommunity() async {
    //①現在ログインしているユーザーのユーザーIDを取得する
    final String? uuid = FirebaseAuth.instance.currentUser?.uid.toString();
    //②ユーザーIDを基にデータベースからuserコレクションのtagフィールドを取得する
    final snapshot =
        await FirebaseFirestore.instance.collection('user').doc(uuid).get();
    final data = snapshot.get('tag');
    //③検索クエリを宣言
    final query = FirebaseFirestore.instance
        .collection('community')
        .where('tags', arrayContainsAny: data);
    //④検索してヒットしたQuerySnapshotを格納する変数
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    try {
      //⑤クエリを実行
      querySnapshot = await query.get();
    } on FirebaseException catch (e) {
      print("エラーが発生しました。：" + e.message.toString());
    }

    if (querySnapshot != null) {
      communities =
          querySnapshot.docs.map((doc) => Community.fromDoc(doc)).toList();
    } else {
      communities = [];
    }
  }
}
