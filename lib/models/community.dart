import 'package:flutter/material.dart';

class Community {
  const Community({
    required this.circleid,
    required this.circlename,
    required this.circlepicture,
    required this.circleplace,
    required this.circlecontent,
    required this.circleduration,
  });

  final String circleid;
  final String circlename;
  final String circleplace;
  final String circlecontent;
  final Icon circlepicture;
  final String circleduration;
}
