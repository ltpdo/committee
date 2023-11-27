import 'package:committee/component/home_screen_widget/recommended_community_list/recommendedCommunity_item.dart';
import 'package:committee/models/community.dart';
import 'package:committee/provider/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendCommunityScreen extends ConsumerStatefulWidget {
  const RecommendCommunityScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return RecommendedCommunityListState();
  }
}

class RecommendedCommunityListState
    extends ConsumerState<RecommendCommunityScreen> {
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
    return WillPopScope(
      onWillPop: () async => true,
      // スクロール可能な高さ
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text('おすすめのコミュニティ'),
        ),
        body: FutureBuilder(
          future: _data,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return RecommendedCommunityItems(communities: communities);
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('エラーが発生しました'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
