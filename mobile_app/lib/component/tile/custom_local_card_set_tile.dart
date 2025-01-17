import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/data_base/model/card_set_entity.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_set_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/local_card_sets_viewmodel.dart';
import '../../page/detail/entity/local_card_view.dart';

class CustomCardSetTile extends StatelessWidget {
  final CardSetEntity cardSet;
  final void Function(bool value) onActiveChanged;

  const CustomCardSetTile({
    Key? key,
    required this.cardSet,
    required this.onActiveChanged,
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
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ListTile(
                title: const Text("Löschen"),
                leading: const Icon(Icons.delete),
                onTap: () {
                  context
                      .read<LocalCardSetsViewmodel>()
                      .deleteCardSet(cardSet.id!);
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
