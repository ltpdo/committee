import 'package:committee/component/community_screen/community_Detail/community_detail.dart';
import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';

class BelongToCommunityItem extends StatelessWidget {
  const BelongToCommunityItem({
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
                          Text('日時：${communities[index].activityTime!}'),
                          Text('場所：${communities[index].location!}'),
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
