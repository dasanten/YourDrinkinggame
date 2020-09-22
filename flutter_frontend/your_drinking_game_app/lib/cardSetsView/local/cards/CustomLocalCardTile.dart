import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardEntity.dart';

class CustomLocalCardTile extends StatefulWidget {

  final CardEntity card;

  CustomLocalCardTile({this.card});

  @override
  State<StatefulWidget> createState() => _CustomCardTile(card);
}

class _CustomCardTile extends State<CustomLocalCardTile> {

  final CardEntity card;
  _CustomCardTile(this.card);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.content
                      ),
                    ],
                  ),
                ),
            flex: 1,
            ),
            Switch(
                value: card.active,
                onChanged: (value) {
                  setState(() {
                    card.active = value;
                    CardSetDB.cardSetDB.updateCard(card);
                  });
                }
            )
          ],
        ),
    );
  }

}