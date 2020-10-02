import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:your_drinking_game_app/cardSetsView/local/cards/LocalCardView.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardSetEntity.dart';

import 'CustomLocalCardSetTile.dart';
import 'LocalCardSetForm.dart';

class LocalCardSetsView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LocalCardSetsView();
}

class _LocalCardSetsView extends State<LocalCardSetsView> {

  List<CardSetEntity> _cardSetList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: cardSets(),
      floatingActionButton:
        FloatingActionButton(
          onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => CardSetForm())).then((value) => getCardSets()),
          child: Icon(Icons.add),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }


  @override
  void initState() {
    super.initState();
    getCardSets();
  }

  Widget cardSets() {
    return ListView.builder(
      itemCount: _cardSetList.length,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: ()=> Navigator.pushNamed(context, LocalCardView.routeName, arguments: _cardSetList[i]).then((value) => getCardSets()),
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                _buildCardSet(_cardSetList[i]),
                Divider(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCardSet(CardSetEntity cardSet) {
    return CustomCardSetTile(
      cardSet: cardSet,
    );
  }


  void getCardSets() {
    CardSetDB.cardSetDB.getCardSets().then(
        (cardSetList) => {
          setState(
                () => this._cardSetList = cardSetList,
          )
        }
    );
  }
}