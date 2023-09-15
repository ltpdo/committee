import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('コミティ'),
      ),
      body: const Center(child: Text('検索', style: TextStyle(fontSize: 32.0))),
    );
  }
}
