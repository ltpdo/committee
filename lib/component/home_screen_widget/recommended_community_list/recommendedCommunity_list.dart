import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';

class RecommendedCommunityList extends StatelessWidget {
  const RecommendedCommunityList({
    super.key,
    required this.communities,
  });

  final List<Community> communities;

  @override
  Widget build(BuildContext context) {
    return Container(
      // スクロール可能な高さ
      width: double.infinity,
      height: 150,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text('a'),
            SizedBox(
              height: 40,
            ),
            Text('a'),
            SizedBox(
              height: 40,
            ),
            Text('a'),
            SizedBox(
              height: 40,
            ),
            Text('a'),
            SizedBox(
              height: 40,
            ),
            Text('a'),
            SizedBox(
              height: 40,
            ),
            Text('b'),
            SizedBox(
              height: 40,
            ),
            Text('c'),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
