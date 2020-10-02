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
  List<CardSetEntity> _cardSetList;

  @override
  void initState() {
    super.initState();
    _cardSetList = <CardSetEntity>[];
    getCardSets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: _cardSetList.length,
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (_, index) => const Divider(),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              LocalCardView.routeName,
              arguments: _cardSetList[i],
            ).then(
              (value) => getCardSets(),
            ),
            child: CustomCardSetTile(
              cardSet: _cardSetList[i],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardSetForm(),
          ),
        ).then((_) => getCardSets()),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void getCardSets() {
    CardSetDB.cardSetDB.getCardSets().then(
          (cardSetList) => {
            setState(
              () => _cardSetList = cardSetList,
            )
          },
        );
  }
}
