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

  final CardSetEntity cardSet;
  LocalCardView(this.cardSet);

  @override
  State<StatefulWidget> createState() => _LocalCardView(this.cardSet);

}

class _LocalCardView extends State<LocalCardView> {

  _LocalCardView(this._cardSet);

  CardSetEntity _cardSet;
  List<CardEntity> _cardList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kartenset: ${_cardSet.name}"),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.pushNamed(context, CardSetEditForm.routeName, arguments: _cardSet).then((value) =>
                setState((){})
              ),
          ),
        ],
      ),
      body: cards(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.pushNamed(context, LocalCardForm.routeName, arguments: _cardSet).then((value) => getCards()),
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
            onTap: ()=> Navigator.pushNamed(context, CardEditForm.routeName, arguments: _cardList[i]).then((value) => getCards()),
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
    getCards();
  }

  Widget _buildCard(CardEntity card) {
    return CustomLocalCardTile(
        card: card,
    );
  }

  void getCards() {
    CardSetDB.cardSetDB.getCards(_cardSet.id).then(
        (cardList) => {
          setState(
                () => this._cardList = cardList,
          )
        }
    );
  }
}
