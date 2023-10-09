import 'package:committee/component/home_screen_widget/belong_to_community_list/belong_to_community_item.dart';
import 'package:committee/data/dummy_data.dart';
import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';

class belongToCommunityList extends StatelessWidget {
  const belongToCommunityList({
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
            belongToCommunityItem(communities: dummyCommunity),
            belongToCommunityItem(communities: dummyCommunity),
            belongToCommunityItem(communities: dummyCommunity),
          ],
        ),
      ),
    );
  }
}
