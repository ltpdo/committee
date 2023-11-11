import 'package:committee/component/message_screen_widget/chat_room/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key, required this.circleid});

  final String circleid;

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    print(authenticatedUser.uid);

    String _authUid = authenticatedUser.uid;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .where('to', isEqualTo: circleid)
          //.where('uid', isEqualTo: _authUid)
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.hasError) {
          return const Center(
              //child: Text('Something went wrong...'),
              );
        }

        final loadedMessages = chatSnapshot.data?.docs ?? []; // null安全なアクセス

        return ListView.builder(
          padding: const EdgeInsets.only(
            bottom: 40,
            left: 13,
            right: 13,
          ),
          reverse: true,
          itemCount: loadedMessages.length,
          itemBuilder: (ctx, index) {
            final chatMessage =
                loadedMessages[index]!.data() ?? {}; // null安全なアクセス
            final nextChatMessage = index + 1 < loadedMessages.length
                ? loadedMessages[index + 1]?.data() ?? {}
                : null;

            final currentMessageUserId = chatMessage['uid'];
            final nextMessageUserId =
                nextChatMessage != null ? nextChatMessage['uid'] : null;
            final nextUserIsSame = nextMessageUserId == currentMessageUserId;

            if (nextUserIsSame) {
              return MessageBubble.next(
                message: chatMessage['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            } else {
              return MessageBubble.first(
                username: chatMessage['name'],
                message: chatMessage['text'],
                isMe: authenticatedUser.uid == currentMessageUserId,
              );
            }
          },
        );
      },
    );
  }
}
