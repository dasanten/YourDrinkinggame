
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardSet.dart';

class CustomCardSetTile extends StatefulWidget {

  final CardSet cardSet;

  const CustomCardSetTile({Key key, this.cardSet}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomCardSetTile(cardSet);
}


class _CustomCardSetTile extends State<CustomCardSetTile> {

  final CardSet cardSet;

  _CustomCardSetTile(this.cardSet);

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
                        cardSet.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      Text(cardSet.description),
                    ],
                  )
                ),
                flex: 1,
            ),
            Switch(
                value: cardSet.active,
                onChanged: (value){
                  setState(() {
                    cardSet.active = value;
                    CardSetDB.cardSetDB.update(cardSet);
                  });
                }
            )
          ],
        ),
    );
  }

}