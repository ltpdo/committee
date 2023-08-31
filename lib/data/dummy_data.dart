import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';

const dummy_community = [
  Community(
    circleid: '1',
    circlename: '野球',
    circlepicture: Icon(Icons.sports_baseball),
    circleplace: '東京',
    circlecontent: '楽しいサークルです。',
    circleduration: '日曜日',
  ),
  Community(
    circleid: '2',
    circlename: 'サッカー',
    circlepicture: Icon(Icons.sports_soccer),
    circleplace: '大阪',
    circlecontent: '面白いサークルです。',
    circleduration: '土曜日',
  ),
  Community(
    circleid: '3',
    circlename: 'バスケットボール',
    circlepicture: Icon(Icons.sports_basketball),
    circleplace: '福岡',
    circlecontent: '騒がしいサークルです。',
    circleduration: '金曜日',
  ),
];
