import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/page/detail/dto/workshop_card_set_details.dart';
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
        builder: (context, viewModel, child) {
      if (viewModel.isLoading) {
        return Scaffold(
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (viewModel.cardSet != null) {
        return Scaffold(
          appBar: AppBar(
            title: SingleChildScrollView(
              child: Text(
                "Workshop Kartenset: ${viewModel.cardSet!.name}",
              ),
              scrollDirection: Axis.horizontal,
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WorkshopCardSetDetails()),
                ),
                icon: Icon(Icons.info_outline),
              )
            ],
          ),
          body: ListView.separated(
            itemCount: viewModel.cardSet!.cards!.length,
            separatorBuilder: (_, index) => const Divider(),
            itemBuilder: (context, i) {
              return CustomWorkshopCardTile(
                card: viewModel.cardSet!.cards![i],
              );
            },
          ),
        );
      }
      return Scaffold(
        body: const Center(
          child: Text('Keine Karten gefunden.'),
        ),
      );
    });
  }
}
