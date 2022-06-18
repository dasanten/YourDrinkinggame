import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/data_base/model/card_entity.dart';
import 'package:your_drinking_game_app/page/form/cards/card_edit_form.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_set_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_viewmodel.dart';


class CustomLocalCardTile extends StatelessWidget {
  final CardEntity card;
  final void Function(bool value) onActiveChanged;

  const CustomLocalCardTile({
    Key? key,
    required this.card,
    required this.onActiveChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(card.content),
        trailing: Switch(
          value: card.active,
          onChanged: onActiveChanged,
        ),
        onTap: () async {
          context.read<CurrentCardViewmodel>().setCard(card);
          await Navigator.pushNamed(
            context,
            CardEditForm.routeName,
            arguments: card,
          );
        },
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ListTile(
                title: const Text("Löschen"),
                leading: const Icon(Icons.delete),
                onTap: () {
                  context.read<CurrentCardSetViewmodel>().deleteCard(card.id!);
                  Navigator.pop(context);
                },
              );
            },
          );
        },
      ),
    );
  }
}
