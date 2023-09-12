import 'package:committee/MessageScreen_widget/ChatRoom/widgets/chat_messages.dart';
import 'package:committee/MessageScreen_widget/ChatRoom/widgets/new_message.dart';
import 'package:committee/models/community.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.circleid,
    required this.circlename,
  });

  final String circleid;
  final String circlename;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.circlename + " ID:" + widget.circleid),
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatMessages(circleid: widget.circleid),
          ),
          NewMessage(circleid: widget.circleid),
        ],
      ),
    );
  }
}
