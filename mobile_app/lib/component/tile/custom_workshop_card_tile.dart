import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/extension/card_extension.dart';

class CustomWorkshopCardTile extends StatelessWidget {
  final CardDto card;
  final void Function(bool value)? onActiveChanged;

  const CustomWorkshopCardTile({
    Key? key,
    required this.card,
    this.onActiveChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      color: card.color,
      child: ListTile(
        trailing: card.card!=null ? Text("2"): null,
        title: Text(card.content!),
      ),
    );
  }
}
