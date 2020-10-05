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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardSet.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(cardSet.description),
              ],
            ),
          ),
          Switch(
            value: cardSet.active,
            onChanged: onActiveChanged,
          ),
        ],
      ),
    );
  }
}
