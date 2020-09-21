import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'file:///D:/app/flutter_frontend/your_drinking_game_app/lib/cardSetsView/local/CustomLocalCardSetTile.dart';
import 'package:your_drinking_game_app/cardSetsView/local/LocalCardSetForm.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardSet.dart';

class LocalCardSetsView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LocalCardSetsView();
}

class _LocalCardSetsView extends State<LocalCardSetsView> {

  List<CardSet> _cardSetList = [];

  @override
  Widget build(BuildContext context) {
    getCardSets();

    return Scaffold (
      body: cardSets(),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CardSetForm()));
        },
        child: Icon(Icons.add),
      )
    );
  }


  @override
  void initState() {
    super.initState();
  }

  Widget cardSets() {
    return ListView.builder(
      itemCount: _cardSetList.length,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return Column(
          children: [
            _buildCardSet(_cardSetList[i]),
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
                () => this._cardSetList = cardSetList,
          )
        }
    );
  }


}