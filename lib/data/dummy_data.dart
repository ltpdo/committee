import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';

const dummy_community = [
  Community(
    circleId: '1',
    circleName: '野球',
    circlePicture: Icon(Icons.sports_baseball),
    circlePlace: '東京',
    circleContent: '楽しいサークルです。',
    circleDuration: '日曜日',
  ),
  Community(
    circleId: '2',
    circleName: 'サッカー',
    circlePicture: Icon(Icons.sports_soccer),
    circlePlace: '大阪',
    circleContent: '面白いサークルです。',
    circleDuration: '土曜日',
  ),
  Community(
    circleId: '3',
    circleName: 'バスケットボール',
    circlePicture: Icon(Icons.sports_basketball),
    circlePlace: '福岡',
    circleContent: '騒がしいサークルです。',
    circleDuration: '金曜日',
  ),
];
