import 'package:flutter/material.dart';

import '../../../HttpService/Dto/CardDto.dart';
import '../../../HttpService/Dto/CardSetDto.dart';
import '../../../models/CardSetCardsArguments.dart';
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
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as CardSetCardsArguments;
    _cardSet = args.cardSet;
    _cardList = _cardSet.cardList;

    return Scaffold(
      appBar: AppBar(
        title: Text("Kartenset: ${_cardSet.name}"),
      ),
      body: ListView.separated(
        itemCount: _cardList.length,
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
