import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../viewmodel/current_card_set_viewmodel.dart';
import '../../../viewmodel/local_card_sets_viewmodel.dart';
import '../cards/LocalCardView.dart';
import 'CustomLocalCardSetTile.dart';
import 'LocalCardSetForm.dart';

class LocalCardSetsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocalCardSetsViewmodel>(
        builder: (context, viewmodel, child) {
          if (viewmodel.cardSetList.isNotEmpty) {
            return ListView.separated(
              itemCount: viewmodel.cardSetList.length,
              padding: const EdgeInsets.all(16.0),
              separatorBuilder: (_, index) => const Divider(),
              itemBuilder: (context, i) {
                final cardSet = viewmodel.cardSetList.elementAt(i);

                return GestureDetector(
                  onTap: () {
                    context.read<CurrentCardSetViewmodel>().setCardSet(
                          cardSet,
                        );
                    Navigator.pushNamed(context, LocalCardView.routeName);
                  },
                  child: CustomCardSetTile(
                    cardSet: cardSet,
                    onActiveChanged: (value) async {
                      await viewmodel.updateCardSet(
                        cardSet.copyWith(active: value),
                      );
                    },
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
