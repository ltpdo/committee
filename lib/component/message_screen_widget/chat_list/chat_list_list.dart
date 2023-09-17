import 'package:committee/component/message_screen_widget/chat_list/chat_list_item.dart';
import 'package:committee/data/dummy_data.dart';
import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';

class TolkList extends StatelessWidget {
  const TolkList({
    super.key,
    required this.interlocuter,
    required this.onRemoveTolk,
  });

  final List<Community> interlocuter;
  final void Function(Community community) onRemoveTolk;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: interlocuter.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(interlocuter[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
        ),
        onDismissed: (direction) {
          onRemoveTolk(
            interlocuter[index],
          );
        },
        child: Center(
          child: tolkListItem(
            interlocuter[index],
          ),
        ),
      ),
    );
  }
}
