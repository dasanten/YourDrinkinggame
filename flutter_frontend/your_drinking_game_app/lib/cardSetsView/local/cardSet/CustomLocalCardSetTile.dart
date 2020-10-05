import 'package:flutter/material.dart';

import '../../../models/CardSetEntity.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: SwitchListTile(
        title: Text(cardSet.name),
        subtitle: Text(cardSet.description),
        value: cardSet.active,
        onChanged: onActiveChanged,
      ),
    );
  }
}
