import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../dataBase/CardSetDB.dart';
import '../../../models/CardSetEntity.dart';
import '../cards/LocalCardView.dart';
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
            ).then((value) => getCardSets()),
            child: CustomCardSetTile(
              cardSet: _cardSetList[i],
              onActiveChanged: (value) {
                setState(() {
                  _cardSetList[i] = _cardSetList[i].copyWith(active: value);
                });
                CardSetDB.cardSetDB.updateCardSet(_cardSetList[i]);
              },
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
          (cardSetList) => setState(
            () => _cardSetList = cardSetList,
          ),
        );
  }
}
