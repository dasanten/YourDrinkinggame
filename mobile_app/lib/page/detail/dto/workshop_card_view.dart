import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/viewmodel/current_workshop_card_set_viewmodel.dart';

import '../../../component/tile/custom_workshop_card_tile.dart';

class WorkshopCardView extends StatefulWidget {
  static const routeName = '/WorkshopCardDisplay';

  @override
  State<StatefulWidget> createState() => _WorkshopCardViewState();
}


class _WorkshopCardViewState extends State<WorkshopCardView> {

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentWorkshopCardSetViewmodel>(
      builder: (context, viewmodel, child) {
        if (viewmodel.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (viewmodel.cardSet != null) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Workshop Kartenset: ${viewmodel.cardSet!.name}"),
            ),
            body: ListView.separated(
              itemCount: viewmodel.cardSet!.cards!.length,
              separatorBuilder: (_, index) => const Divider(),
              itemBuilder: (context, i) {
                return CustomWorkshopCardTile(
                  card: viewmodel.cardSet!.cards![i],
                );
              },
            ),
          );
        }
        return const Center(
          child: Text('Keine Sets gefunden.'),
        );
      }
    );
  }
  

}