import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key, required this.circleid});

  final String circleid;

  @override
  State<NewMessage> createState() {
    return _NewMessageState();
  }
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _submitMessage() async {
    final enteredMessage = _messageController.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    final user = FirebaseAuth.instance.currentUser!;
    final userData =
        await FirebaseFirestore.instance.collection('user').doc(user.uid).get();

    if (user != null) {
      final String uid = user.uid;
      String email = user.email!;
      print('UID: $uid');
      print('Email: $email');
    } else {
      print('b');
    }

    FirebaseFirestore.instance.collection('chat').add({
      'text': enteredMessage,
      'createdAt': Timestamp.now(),
      'uid': user.uid,
      'to': widget.circleid,
      //'name': userData.data()!['name'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 1,
        bottom: 14,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(labelText: 'Send a message...'),
            ),
          ),
          IconButton(
            onPressed: _submitMessage,
            icon: const Icon(Icons.send),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
