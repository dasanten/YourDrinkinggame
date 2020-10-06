import 'package:flutter/material.dart';

import '../../../models/CardEntity.dart';

class CustomLocalCardTile extends StatelessWidget {
  final CardEntity card;
  final void Function(bool value) onActiveChanged;

  const CustomLocalCardTile({
    Key key,
    @required this.card,
    @required this.onActiveChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        title: Text(card.content),
        trailing: Switch(
          value: card.active,
          onChanged: onActiveChanged,
        ),
      ),
    );
  }
}
