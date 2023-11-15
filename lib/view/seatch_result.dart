import 'package:committee/component/home_screen_widget/recommended_community_list/recommendedCommunity_item.dart';
import 'package:committee/models/community.dart';
import 'package:committee/provider/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultScreen extends ConsumerStatefulWidget {
  final String? name;
  const SearchResultScreen({super.key, this.name});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SearchResultScreenState();
  }
}

class SearchResultScreenState extends ConsumerState<SearchResultScreen> {
  List<Community> communities = [];
  late Future<void> _data;
  Future<void> _searchCommunityData() async {
    return await ref
        .read(userServiceProvider)
        .searchCommunity(widget.name)
        .then((_) => communities = ref.watch(userServiceProvider).communities);
  }

  @override
  void initState() {
    super.initState();
    _data = _searchCommunityData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('検索結果'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
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
              }),
        ),
      ),
    );
  }
}
