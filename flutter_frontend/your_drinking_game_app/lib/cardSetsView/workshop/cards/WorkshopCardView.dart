import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/models/CardSetCardsArguments.dart';

import '../../../HttpService/Dto/CardDto.dart';
import '../../../HttpService/Dto/CardSetDto.dart';
import 'CustomWorkshopCardTile.dart';

class WorkshopCardView extends StatefulWidget {
  static const routeName = '/WorkshopCardDisplay';

  @override
  State<StatefulWidget> createState() => _WorkshopCardView();
}

class _WorkshopCardView extends State<WorkshopCardView> {
  CardSetDto _cardSet = CardSetDto();
  List<CardDto> _cardList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as CardSetCardsArguments;
    _cardList = args.cardList;
    _cardSet = args.cardSet;
    return Scaffold(
      appBar: AppBar(
        title: Text("Kartenset: ${_cardSet.name}"),
      ),
      body: ListView.separated(
        itemCount: _cardList.length,
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (_, index) => const Divider(),
        itemBuilder: (context, i) {
          return CustomWorkshopCardTile(
              card: _cardList[i],
            );
        },
      ),
    );
  }
}