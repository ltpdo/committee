import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:committee/models/tag.dart';

class User {
  String userId = '';
  String? userName;
  File? userPicture;
  String? userRole;
  List<Tag>? userTags;

  User(DocumentSnapshot doc) {
    userId = doc['uid'];
    userName = doc['name'];
    userPicture = doc['picture'];
    userRole = doc['urole'];
    userTags = doc['tags'];
  }
}
