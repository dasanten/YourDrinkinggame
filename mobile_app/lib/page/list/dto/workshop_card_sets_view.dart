import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/viewmodel/workshop_card_set_viewmodel.dart';

import '../../../component/tile/custom_workshop_card_set_tile.dart';

class WorkshopCardSetsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkshopCardSetViewmodel>(
      builder: (context, viewmodel, child) {
        if (viewmodel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (viewmodel.cardSetList.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: viewmodel.getWorkshopCardSets,
            child: ListView.separated(
              itemCount: viewmodel.cardSetList.length,
              separatorBuilder: (_, index) => const Divider(),
              itemBuilder: (context, i) => CustomWorkshopCardSetTile(
                cardSet: viewmodel.cardSetList[i],
                isLocal: viewmodel.getCardSetLocalById(
                  viewmodel.cardSetList[i].id!,
                ),
              ),
            ),
          );
        }
        return const Center(
          child: Text('Keine Sets gefunden.'),
        );
      },
    );
  }
}
