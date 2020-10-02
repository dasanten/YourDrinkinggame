import 'package:flutter/material.dart';

import 'package:your_drinking_game_app/cardSetsView/CardEditForm.dart';
import 'package:your_drinking_game_app/cardSetsView/CardSetEditForm.dart';
import 'package:your_drinking_game_app/cardSetsView/local/cards/LocalCardForm.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardEntity.dart';
import 'package:your_drinking_game_app/models/CardSetEntity.dart';

import '../cards/CustomLocalCardTile.dart';

class LocalCardView extends StatefulWidget {
  static const routeName = '/LocalCardDisplay';

  final CardSetEntity cardSet;
  const LocalCardView(this.cardSet);

  @override
  State<StatefulWidget> createState() => _LocalCardView();
}

class _LocalCardView extends State<LocalCardView> {
  CardSetEntity _cardSet;
  List<CardEntity> _cardList = [];

  @override
  void initState() {
    super.initState();
    _cardSet = widget.cardSet;
    getCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kartenset: ${_cardSet.name}"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.pushNamed(
              context,
              CardSetEditForm.routeName,
              arguments: _cardSet,
            ).then(
              (value) => setState(() {}),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: _cardList.length,
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (_, index) => const Divider(),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              CardEditForm.routeName,
              arguments: _cardList[i],
            ).then((_) => getCards()),
            child: CustomLocalCardTile(
              card: _cardList[i],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, LocalCardForm.routeName,
                arguments: _cardSet)
            .then((value) => getCards()),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void getCards() {
    CardSetDB.cardSetDB.getCards(_cardSet.id).then(
          (cardList) => {
            setState(
              () => _cardList = cardList,
            )
          },
        );
  }
}
