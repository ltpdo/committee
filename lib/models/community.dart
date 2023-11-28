import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:committee/models/tag.dart';

class Community {
  final String? circleId;
  String? name;
  List<Tag>? tags;
  String? location;
  String? content;
  String? activityTime;
  List<String>? members;
  List<String>? representative;
  String? picture;
  String? url;

  Community({
    this.circleId,
    this.name,
    this.tags,
    this.location,
    this.content,
    this.activityTime,
    this.members,
    this.representative,
    this.picture,
    this.url,
  });

  Community.fromDoc(QueryDocumentSnapshot<Map<String, dynamic>> doc)
      : circleId = doc.id,
        name = doc['name'],
        activityTime = doc['activityTime'],
        content = doc['content'],
        location = doc['location'],
        members = doc['members'].cast<String>() ?? [],
        tags = doc['tags'].cast<Tag>() ?? [],
        picture = doc['picture'] ?? "";
}
