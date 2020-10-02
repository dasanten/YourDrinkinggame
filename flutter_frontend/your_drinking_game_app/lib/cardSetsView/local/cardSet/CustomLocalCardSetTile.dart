import 'package:flutter/material.dart';

import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardSetEntity.dart';

class CustomCardSetTile extends StatefulWidget {
  final CardSetEntity cardSet;

  const CustomCardSetTile({Key key, this.cardSet}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomCardSetTile();
}

class _CustomCardSetTile extends State<CustomCardSetTile> {
  CardSetEntity cardSet;

  @override
  void initState() {
    super.initState();
    cardSet = widget.cardSet;
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
                Text(
                  cardSet.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(cardSet.description),
              ],
            ),
          ),
          Switch(
            value: widget.cardSet.active,
            onChanged: (value) {
              setState(() {
                cardSet = cardSet.copyWith(active: value);
              });
              CardSetDB.cardSetDB.updateCardSet(widget.cardSet);
            },
          ),
        ],
      ),
    );
  }
}
