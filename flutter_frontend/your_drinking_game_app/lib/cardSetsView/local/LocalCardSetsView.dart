import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:your_drinking_game_app/cardSetsView/CustomCardSetTile.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardSet.dart';

class LocalCardSetsView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LocalCardSetsView();
}

class _LocalCardSetsView extends State<LocalCardSetsView> {

  List<CardSet> cardSetList = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      body: cardSets(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          CardSetDB.cardSetDB.insertCardSet(
            new CardSet("name", "description", "workshopId", true)
          ).then((value) => setState(() => this.cardSetList.add(value)))
        },
        child: Icon(Icons.add),
      )
    );
  }


  @override
  void initState() {
    super.initState();
    getCardSets();
  }

  Widget cardSets() {
    return ListView.builder(
      itemCount: cardSetList.length,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return Column(
          children: [
            _buildCardSet(cardSetList[i]),
            Divider(),
          ],
        );
      },
    );
  }

  Widget _buildCardSet(CardSet cardSet) {
    return CustomCardSetTile(
      cardSet: cardSet,
    );
  }


  getCardSets() {
    CardSetDB.cardSetDB.getCardSets().then(
            (cardSetList) => {
          setState(
                () => this.cardSetList = cardSetList,
          )
        }
    );
  }


}