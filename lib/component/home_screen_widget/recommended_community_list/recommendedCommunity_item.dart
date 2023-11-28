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
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (community.picture == "" ||
                        community.picture == null) ...{
                      IconTheme(
                        data: IconThemeData(size: size.width / 1.1),
                        child: const Icon(Icons.account_box),
                      ),
                    } else ...{
                      SizedBox(
                        width: size.width / 1.1,
                        height: size.width / 1.1,
                        child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.network(community.picture ?? "")),
                      )
                    },
                    const SizedBox(width: 10),
                    SizedBox(
                      width: size.width * 4 / 5,
                      child: Text(
                        community.name!,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '日時：${community.activityTime!}',
                          style: TextStyle(fontSize: 20),
                        ),
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
