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
}
