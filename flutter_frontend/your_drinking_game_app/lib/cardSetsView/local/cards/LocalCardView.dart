import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/cardSetsView/CardEditForm.dart';
import 'package:your_drinking_game_app/cardSetsView/CardSetEditForm.dart';
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
        title: Text("Kartenset: ${_cardSet.name}"),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.pushNamed(context, CardSetEditForm.routeName, arguments: _cardSet),
          ),
        ],
      ),
      body: cards(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, LocalCardForm.routeName, arguments: _cardSet),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget cards() {
    return ListView.builder(
        itemCount: _cardList.length,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: ()=> Navigator.pushNamed(context, CardEditForm.routeName, arguments: _cardList[i]),
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  _buildCard(_cardList[i]),
                  Divider(),
                ],
              ),
            )
          );
        }
    );
  }

  @override
  void initState() {
    super.initState();
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
