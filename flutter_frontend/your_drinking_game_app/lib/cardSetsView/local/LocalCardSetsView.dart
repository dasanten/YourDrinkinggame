import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:your_drinking_game_app/models/CardSet.dart';

class LocalCardSetsView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LocalCardSetsView();
}

class _LocalCardSetsView extends State<LocalCardSetsView> {

  List<CardSet> cardSetList = [];

  @override
  Widget build(BuildContext context) {

    CardSet cardSet1 = new CardSet();
    cardSet1
      ..description = "test"
      ..name = "Test Beschreibung";

    CardSet cardSet2 = new CardSet();
    cardSet2
      ..description = "test2"
      ..name = "Test Beschreibung";

    cardSetList.add(cardSet1);
    cardSetList.add(cardSet2);

    return Scaffold (
      body: cardSets()
    );
  }


  Widget cardSets() {
    return ListView.builder(
      itemCount: cardSetList.length,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return _buildCardSet(cardSetList[i]);
      },
    );
  }

  Widget _buildCardSet(CardSet cardSet) {
    return ListTile (
      title: Text(cardSet.name),
      subtitle: Text(cardSet.description),
    );
  }



}