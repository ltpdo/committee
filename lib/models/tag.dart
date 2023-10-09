//Tagを扱うクラス。ここにはタグのフィールドとコンストラクタのみ書く。
//Tagに関するロジックは/lib/provider/tag_service.dartを参照してください。
import 'package:cloud_firestore/cloud_firestore.dart';

class Tag {
  final String? name;

  Tag({this.name});

  Tag.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc)
      : name = doc['name'];
}
