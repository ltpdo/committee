import 'package:committee/component/search_screen_widget/search_button.dart';
import 'package:committee/component/search_screen_widget/text_fotm.dart';
import 'package:committee/provider/text_editing_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
            centerTitle: true,
            title: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                children: [
                  TextSpan(
                    text: 'コミティ',
                    style: GoogleFonts.zenMaruGothic(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const WidgetSpan(
                    child: Icon(
                      Icons.search,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ),
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
