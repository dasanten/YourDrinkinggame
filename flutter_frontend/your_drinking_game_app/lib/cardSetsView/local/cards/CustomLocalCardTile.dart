import 'package:flutter/material.dart';

import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardEntity.dart';

class CustomLocalCardTile extends StatefulWidget {
  final CardEntity card;

  const CustomLocalCardTile({this.card});

  @override
  State<StatefulWidget> createState() => _CustomCardTile();
}

class _CustomCardTile extends State<CustomLocalCardTile> {
  CardEntity card;

  @override
  void initState() {
    super.initState();
    card = widget.card;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.content),
              ],
            ),
          ),
          Switch(
            value: card.active,
            onChanged: (value) {
              setState(() {
                card.active = value;
                CardSetDB.cardSetDB.updateCard(card);
              });
            },
          ),
        ],
      ),
    );
  }
}
