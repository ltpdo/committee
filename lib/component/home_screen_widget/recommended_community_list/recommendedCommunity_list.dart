import 'package:committee/component/home_screen_widget/recommended_community_list/recommendedCommunity_item.dart';
import 'package:committee/models/community.dart';
import 'package:committee/provider/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendedCommunityList extends ConsumerStatefulWidget {
  const RecommendedCommunityList({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return RecommendedCommunityListState();
  }
}

class RecommendedCommunityListState
    extends ConsumerState<RecommendedCommunityList> {
  List<Community> communities = [];
  late Future<void> _data;
  Future<void> _getCommunityData() async {
    return await ref
        .read(userServiceProvider)
        .fetchCommunity()
        .then((_) => communities = ref.watch(userServiceProvider).communities);
  }

//
  @override
  void initState() {
    super.initState();
    _data = _getCommunityData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return RecommendedCommunityItems(communities: communities);
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                const Text('エラーが発生しました'),
                Text(snapshot.error.toString()),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
