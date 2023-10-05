import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userServiceProvider = Provider((ref) {
  return userService();
});

class userService {
  //タグを登録する
  Future<void> registerTags(List<String> userTags) async {
    //現在ログインしているユーザーのユーザーIDを取得する
    final String? uuid = FirebaseAuth.instance.currentUser?.uid.toString();
    //データベースからユーザーIDを探す
    final doc = FirebaseFirestore.instance.collection('user').doc(uuid);
    try {
      //データベースに'tag'というフィールドを作ってその中にuserTagsの中身を入れる
      await doc.update({
        'tag': [
          for (String tag in userTags) ...{tag}
        ]
      });
    } catch (e) {
      print(e);
    }
  }
}
