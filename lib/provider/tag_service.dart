import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:committee/models/tag.dart';
import 'package:committee/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//TagServiceを監視するプロバイダー
final tagServiceProvider = Provider((ref) {
  return TagService();
});

//Tagに関するロジックを格納するクラス
class TagService {
  List<Tag> tags = [];

  //データベースから全てのタグを取得するメソッド
  Future<void> fetchTags() async {
    //Firestoreからコレクション'tag'(QuerySnapshot)を取得してcollectionに代入。
    final collection = await FirebaseFirestore.instance.collection('tag').get();

    /*
    docs:     docs(List<QueryDocumentSnapshot<T>>型)のドキュメント全てをリストにして取り出す。
    map():    Listの各要素をTagに変換
    toList(): map()から帰ってきたIterableをListに変換する
    */
    final List<Tag> tags =
        collection.docs.map((doc) => Tag.fromDoc(doc)).toList();
    this.tags = tags;
  }
}
