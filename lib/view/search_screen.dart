import 'package:committee/component/search_screen_widget/search_button.dart';
import 'package:committee/component/search_screen_widget/text_fotm.dart';
import 'package:committee/provider/text_editing_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextForm(
                  name: '名前',
                  color: Colors.red,
                  controller: ref.watch(nameControllerProvider),
                ),
                SizedBox(
                  height: size.height / 25,
                ),
                SearchButton(
                  nameController: ref.watch(nameControllerProvider),
                ),
              ],
            ),
          )),
    );
  }
}
