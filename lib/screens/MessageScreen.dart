import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('コミティ'),
      ),
      body:
          const Center(child: Text('メッセージ', style: TextStyle(fontSize: 32.0))),
    );
  }
}
