import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/cardSetsView/local/cards/LocalCardForm.dart';
import '../cards/CustomLocalCardTile.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardEntity.dart';
import 'package:your_drinking_game_app/models/CardSetEntity.dart';

class LocalCardView extends StatefulWidget{

  static const routeName = '/LocalCardDisplay';

  @override
  State<StatefulWidget> createState() => _LocalCardView();

}

class _LocalCardView extends State<LocalCardView> {

  CardSetEntity _cardSet;
  List<CardEntity> _cardList = [];

  @override
  Widget build(BuildContext context) {
    _cardSet = ModalRoute.of(context).settings.arguments;
    getCards();

    return Scaffold(
      appBar: AppBar(
        title: Text(_cardSet.name),
      ),
      body: cards(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, LocalCardForm.routeName, arguments: _cardSet),
      ),
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
    CardSetDB.cardSetDB.getCards(_cardSet.id).then(
        (cardList) => {
          setState(
                () => this._cardList = cardList,
          )
        }
    );
  }
}
