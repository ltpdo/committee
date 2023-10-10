import 'package:committee/component/community_screen/community_Detail/communityDetail.dart';
import 'package:committee/models/community.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:committee/data/dummy_data.dart';

class belongToCommunityItem extends StatelessWidget {
  const belongToCommunityItem({
    super.key,
    required this.communities,
    required this.index,
  });

  final List<Community> communities;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CommunityDetailScreen(
                community: communities[index],
              );
            },
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        communities[index].name!,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(width: 70),
                    Expanded(
                      child: Column(
                        children: [
                          Text('日時：' + communities[index].activityTime!),
                          Text('場所：' + communities[index].location!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
