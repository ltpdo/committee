import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';
import 'package:committee/data/dummy_data.dart';

class belongToCommunityItem extends StatelessWidget {
  const belongToCommunityItem({super.key, required this.communities});

  final List<Community> communities;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconTheme(
              data: IconThemeData(size: 30),
              child: dummy_community[0].circlepicture,
            ),
            const SizedBox(width: 10),
            Text(
              dummy_community[0].circlename,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 100),
            Column(
              children: [
                Text('日時：' + dummy_community[0].circleduration),
                Text('場所：' + dummy_community[0].circleplace),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
