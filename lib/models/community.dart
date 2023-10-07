import 'package:flutter/material.dart';

class Community {
  const Community({
    required this.circleId,
    required this.circleName,
    required this.circlePicture,
    required this.circlePlace,
    required this.circleContent,
    required this.circleDuration,
  });

  final String circleId;
  final String circleName;
  final String circlePlace;
  final String circleContent;
  final Icon circlePicture;
  final String circleDuration;

  get amount => null;
}
