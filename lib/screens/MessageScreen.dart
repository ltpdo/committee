import 'package:committee/data/dummy_data.dart';
import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';
import '../MessageScreen_widget/tolkList_list.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text('選択'),
        ),
        body: Column(
          children: [
            Expanded(
              child: TolkList(
                interlocuter: dummy_community,
                onRemoveTolk: (community) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
