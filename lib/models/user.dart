import 'package:committee/models/tag.dart';

class User {
  String? email;
  String? name;
  String? picture;
  List<Tag>? tags;
  final String? uid;
  final String? urole;
  String? content;

  User({
    this.email,
    this.name,
    this.picture,
    this.tags,
    this.uid,
    this.urole,
    this.content,
  });
}
