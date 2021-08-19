import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/http_service/CardSetService.dart';

import '../../../http_service/dto/CardSetDto.dart';
import '../../../models/CardSetCardsArguments.dart';
import '../../../viewmodel/local_card_sets_viewmodel.dart';
import '../../../viewmodel/workshop_card_set_viewmodel.dart';
import '../cards/WorkshopCardView.dart';

class CustomWorkshopCardSetTile extends StatelessWidget {
  final CardSetDto cardSet;
  final bool isLocal;

  const CustomWorkshopCardSetTile({
    Key? key,
    required this.cardSet,
    required this.isLocal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(cardSet.name),
        subtitle: Text(cardSet.description),
        trailing: IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: isLocal
                ? null
                : () async {
                    final result = await context
                        .read<LocalCardSetsViewmodel>()
                        .importCardSetFromWorkshop(cardSet);
                      context.read<WorkshopCardSetViewmodel>().refreshCardSetLocalById(cardSet.id, isLocal: result,);
                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Kartenset hinzugefügt!"),
                        ),
                      );
                      CardSetService.favorCardSet(cardSet.id);
                    }
                  },
          ),
        onTap: () => Navigator.pushNamed(
          context,
          WorkshopCardView.routeName,
          arguments: CardSetCardsArguments(cardSet),
        ),
      ),
    );
  }
}
