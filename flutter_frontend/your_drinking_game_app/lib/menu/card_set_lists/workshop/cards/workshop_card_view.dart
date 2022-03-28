import 'package:flutter/material.dart';
import '../../../../data_base/models/card_set_cards_arguments.dart';

import 'custom_workshop_card_tile.dart';

class WorkshopCardView extends StatelessWidget {
  static const routeName = '/WorkshopCardDisplay';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments! as CardSetCardsArguments;
    final _cardSet = args.cardSet;
    final _cardList = _cardSet.cardList;

    return Scaffold(
      appBar: AppBar(
        title: Text("Workshop Kartenset: ${_cardSet.name}"),
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