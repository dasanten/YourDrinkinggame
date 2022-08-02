import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/extension/card_extension.dart';

class InfoBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            title: const Text("Alle Karten"),
            subtitle: const Text("Um einen Spieler inenrhalb einer Regel zu nennen, musst du an die Stelle ein \"@\" einfügen. Die Farben innerhalb dieser Info sind die Farben mit denen diese im Spiel angezeigt werden"),
            leading: const Icon(Icons.list),
          ),
        ),
        ...CardType.values.map<Padding>((type) => 
          Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              tileColor: type.color,
              leading: type.icon,
              title: Text(type.toString()),
              subtitle: Text(type.description),
                ),
          )
        ).toList(),
      ]
    );
  }

}