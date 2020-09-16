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

    CardSet cardSet3 = new CardSet();
    cardSet3
      ..description = "test2"
      ..name = "Test Beschreibung";
    CardSet cardSet4 = new CardSet();
    cardSet4
      ..description = "test2"
      ..name = "Test Beschreibung";
    CardSet cardSet5 = new CardSet();
    cardSet5
      ..description = "test2"
      ..name = "Test Beschreibung";
    CardSet cardSet6 = new CardSet();
    cardSet6
      ..description = "test2"
      ..name = "Test Beschreibung";
    CardSet cardSet7 = new CardSet();
    cardSet7
      ..description = "test2"
      ..name = "Test Beschreibung";
    CardSet cardSet8 = new CardSet();
    cardSet8
      ..description = "test2"
      ..name = "Test Beschreibung";
    CardSet cardSet9 = new CardSet();
    cardSet9
      ..description = "test2"
      ..name = "Test Beschreibung";
    CardSet cardSet10 = new CardSet();
    cardSet10
      ..description = "test2"
      ..name = "Test Beschreibung";
    cardSetList.addAll([cardSet1, cardSet2, cardSet3, cardSet4, cardSet5, cardSet6, cardSet7, cardSet8, cardSet9, cardSet10]);

    return Scaffold (
      body: cardSets(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      )
    );
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
    return ListTile (
      title: Text(cardSet.name),
      subtitle: Text(cardSet.description),
    );
  }



}