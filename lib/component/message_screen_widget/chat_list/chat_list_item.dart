import 'package:committee/component/message_screen_widget/chat_room/screens/chat.dart';
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
              return ChatScreen(
                circleid: community.circleId,
                circlename: community.circleName,
              );
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
                  community.circlePicture,
                  SizedBox(width: 15),
                  Text(community.circleName),
                  SizedBox(width: 10),
                  Text(community.circleId),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
