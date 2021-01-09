import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../models/CardSetEntity.dart';
import '../../../viewmodel/current_card_set_viewmodel.dart';
import '../cards/LocalCardView.dart';

class CustomCardSetTile extends StatelessWidget {
  final CardSetEntity cardSet;
  final void Function(bool value) onActiveChanged;

  const CustomCardSetTile({
    Key key,
    @required this.cardSet,
    @required this.onActiveChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(cardSet.name),
        subtitle: Text(cardSet.description),
        trailing: Switch(
          value: cardSet.active,
          onChanged: onActiveChanged,
        ),
        onTap: () {
          context.read<CurrentCardSetViewmodel>().setCardSet(
                cardSet,
              );
          Navigator.pushNamed(context, LocalCardView.routeName);
        },
      ),
    );
  }
}
