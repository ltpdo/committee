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
              child: const Icon(Icons.person),
            ),
            const SizedBox(width: 10),
            Text(
              dummyCommunity[0].name!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 100),
            Column(
              children: [
                Text('日時：' + dummyCommunity[0].activityTime!),
                Text('場所：' + dummyCommunity[0].location!),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
