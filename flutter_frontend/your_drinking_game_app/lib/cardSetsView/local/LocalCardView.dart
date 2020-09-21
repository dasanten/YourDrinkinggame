
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/cardSetsView/local/CustomLocalCardTile.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardEntity.dart';

class LocalCardView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LocalCardView();

}

class _LocalCardView extends State<LocalCardView> {

  List<CardEntity> _cardList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cards(),
    );
  }

  Widget cards() {
    return ListView.builder(
        itemCount: _cardList.length,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return Column(
            children: [
              _buildCard(_cardList[i]),
              Divider(),
            ],
          );
        }
    );
  }


  Widget _buildCard(CardEntity card) {
    return CustomLocalCardTile(
        card: card,
    );
  }

  getCards() {
    CardSetDB.cardSetDB.getCards().then(
        (cardList) => {
          setState(
                () => this._cardList = cardList,
          )
        }
    );
  }
}
