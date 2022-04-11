import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/page/form/cardSet/local_card_set_form.dart';
import 'package:your_drinking_game_app/viewmodel/local_card_sets_viewmodel.dart';

import '../../../component/tile/custom_local_card_set_tile.dart';

class LocalCardSetsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocalCardSetsViewmodel>(
        builder: (context, viewmodel, child) {
          if (viewmodel.cardSetList.isNotEmpty) {
            return ListView.separated(
              itemCount: viewmodel.cardSetList.length,
              separatorBuilder: (_, index) => const Divider(),
              itemBuilder: (context, i) {
                final cardSet = viewmodel.cardSetList.elementAt(i);

                return CustomCardSetTile(
                  cardSet: cardSet,
                  onActiveChanged: (value) async {
                    await viewmodel.updateCardSet(
                      cardSet.copyWith(active: value),
                    );
                  },
                );
              },
            );
          } else if (viewmodel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text('Keine Sets gefunden.'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardSetForm(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
