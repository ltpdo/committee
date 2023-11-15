import 'package:committee/provider/text_editing_controller_provider.dart';
import 'package:committee/view/seatch_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchButton extends ConsumerWidget {
  SearchButton({super.key, nameController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 1.2,
      child: ElevatedButton.icon(
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white)),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SearchResultScreen(
                  name: ref.read(nameControllerProvider).text);
            }));
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          label: const Text(
            '検索',
            style: TextStyle(fontSize: 20, color: Colors.black),
          )),
    );
  }
}
