import 'package:committee/MessageScreen_widget/screens/chat.dart';
import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';

class tolkListItem extends StatelessWidget {
  const tolkListItem(this.community, {super.key});

  final Community community;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ChatScreen();
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  community.circlepicture,
                  SizedBox(width: 15),
                  Text(community.circlename),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
