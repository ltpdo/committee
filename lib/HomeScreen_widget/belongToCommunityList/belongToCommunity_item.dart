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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dummy_community[0].circlename,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
