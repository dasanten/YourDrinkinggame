import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/page/form/cardSet/card_set_edit_form.dart';
import 'package:your_drinking_game_app/page/form/cards/local_card_form.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_set_viewmodel.dart';

import '../../../component/tile/custom_local_card_tile.dart';

class LocalCardView extends StatelessWidget {
  static const routeName = '/LocalCardDisplay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<CurrentCardSetViewmodel>(
          builder: (context, viewmodel, child) => Text(
            "Kartenset: ${viewmodel.cardSet!.name}",
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => Navigator.pushNamed(
              context,
              CardSetEditForm.routeName,
            ),
          ),
        ],
      ),
      body: Consumer<CurrentCardSetViewmodel>(
        builder: (context, viewmodel, child) {
          if (viewmodel.cards.isNotEmpty) {
            return ListView.separated(
              itemCount: viewmodel.cards.length,
              separatorBuilder: (_, index) => const Divider(),
              itemBuilder: (context, i) {
                final card = viewmodel.cards[i];
                return CustomLocalCardTile(
                  card: card,
                  onActiveChanged: (value) => viewmodel.updateCard(
                    card.copyWith(
                      active: value,
                    ),
                  ),
                );
              },
            );
          } else if (viewmodel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text('Keine Karten gefunden.'),
            );
          }
        },
      ),
      floatingActionButton: context.select<CurrentCardSetViewmodel, bool>((value) => value.isAdmin || value.isEditor) ? FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          LocalCardForm.routeName,
        ),
        child: const Icon(Icons.add),
      ): null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
