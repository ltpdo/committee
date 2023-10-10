import 'package:committee/models/tag.dart';
import 'package:committee/provider/tag_service.dart';
import 'package:committee/provider/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bottom_navigation_bar/main_page_dtate.dart';

class SelectTagScreen extends ConsumerStatefulWidget {
  final String urole;
  const SelectTagScreen({Key? key, required this.urole}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return SelectTagScreenState();
  }
}

class SelectTagScreenState extends ConsumerState<SelectTagScreen> {
  List<Tag> userTags = [];

  MaterialStateProperty<Color> setButtonColor(List<Tag> userTags) {
    if (userTags.isEmpty) {
      return MaterialStateProperty.all(Colors.grey);
    } else {
      return MaterialStateProperty.all(Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    List tags = [];
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "コミティ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width / 7,
                  ),
                ),
                SizedBox(
                  height: size.height / 70,
                ),
                Text(
                  "タグを最大３つ選んでください。",
                  style: TextStyle(
                    fontSize: size.width / 23,
                  ),
                ),
                SizedBox(
                  height: size.height / 60,
                ),
                SizedBox(
                  height: size.height / 2,
                  child: SingleChildScrollView(
                    child: FutureBuilder(
                        future:
                            ref.watch(tagServiceProvider).fetchTags().then((_) {
                          tags = ref.watch(tagServiceProvider).tags;
                        }),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Column(
                              children: <Widget>[
                                for (Tag tag in tags) ...{
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: FilterChip(
                                      backgroundColor: const Color(0xd9d9d9d9),
                                      selected: userTags.contains(tag.name),
                                      selectedColor: Colors.red,
                                      onSelected: (isSelected) {
                                        if (isSelected) {
                                          if (!tags.contains(tag.name) &&
                                              userTags.length < 3) {
                                            userTags.add(tag);
                                          } else {
                                            return;
                                          }
                                        } else {
                                          userTags.removeWhere((element) {
                                            return element == tag.name;
                                          });
                                        }
                                        setState(() {});
                                      },
                                      label: Text(
                                        tag.name!,
                                        style: TextStyle(
                                            fontSize: size.width / 20,
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                },
                              ],
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else {
                            return const Center(
                              child: Text("エラーが発生しました"),
                            );
                          }
                        }),
                  ),
                ),
                SizedBox(
                  height: size.height / 60,
                ),
                ElevatedButton(
                  onPressed: () async {
                    userTags.isEmpty
                        ? null
                        : await ref
                            .read(userServiceProvider)
                            .registerTags(userTags)
                            .then((_) => Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return MainPageState();
                                })));
                  },
                  style: ButtonStyle(
                    backgroundColor: setButtonColor(userTags),
                    elevation: MaterialStateProperty.all<double>(2.0),
                  ),
                  child: Text(
                    "タグを登録",
                    style: TextStyle(
                      fontSize: size.width / 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
