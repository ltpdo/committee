import 'package:cloud_firestore/cloud_firestore.dart';

//Tagを扱うクラス。ここにはタグのフィールドとコンストラクタのみ書く。
//Tagに関するロジックは/lib/provider/tag_service.dartを参照してください。
class Tag {
  String? name;

  Tag(DocumentSnapshot doc) {
    name = doc['name'];
  }
}
