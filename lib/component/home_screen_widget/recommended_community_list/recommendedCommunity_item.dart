import 'package:committee/component/community_screen/community_Detail/communityDetail.dart';
import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';

class RecommendedCommunityItems extends StatelessWidget {
  final List<Community> communities;

  const RecommendedCommunityItems({
    super.key,
    required this.communities,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        for (Community community in communities) ...{
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return CommunityDetailScreen(
                      community: community,
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
                    const IconTheme(
                      data: IconThemeData(size: 30),
                      child: Icon(Icons.person),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: size.width * 2 / 5,
                      child: Text(
                        community.name!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Column(
                      children: [
                        Text('日時：${community.activityTime!}'),
                        Text('場所：${community.location!}'),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ),
          ),
        }
      ],
    );
  }
}
