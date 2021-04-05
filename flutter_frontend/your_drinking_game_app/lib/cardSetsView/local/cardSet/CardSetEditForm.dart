import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../viewmodel/current_card_set_viewmodel.dart';
import '../../../viewmodel/local_card_sets_viewmodel.dart';
import '../../CardSetsTabView.dart';

final _formKey = GlobalKey<FormState>();

class CardSetEditForm extends StatelessWidget {
  static const routeName = '/editCardSet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<CurrentCardSetViewmodel>(
          builder: (context, viewmodel, child) => Text(
            "Kartenset ${viewmodel.cardSet.name} bearbeiten",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: context
                    .select<CurrentCardSetViewmodel, TextEditingController>(
                  (v) => v.nameController,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Bitte gebe einen Namen ein!';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                maxLength: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              TextFormField(
                controller: context
                    .select<CurrentCardSetViewmodel, TextEditingController>(
                  (v) => v.descriptionController,
                ),
                decoration: const InputDecoration(
                  labelText: 'Beschreibung',
                  border: OutlineInputBorder(),
                ),
                maxLength: 256,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async => deleteCardSet(context),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: const Text("Kartenset löschen!"),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  ElevatedButton(
                    onPressed: () async => updateCardSet(context),
                    child: const Text("Kartenset updaten!"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> deleteCardSet(BuildContext context) async {
    final confirmed = await _deleteDialog(context);
    if (confirmed) {
      final currentCardSetViewmodel = context.read<CurrentCardSetViewmodel>();
      await context.read<LocalCardSetsViewmodel>().deleteCardSet(
            currentCardSetViewmodel.cardSet.id,
          );
      Navigator.popUntil(
        context,
        (route) =>
            route is MaterialPageRoute &&
            route.builder(context) is CardSetsTabView,
      );
      Future.delayed(
        const Duration(milliseconds: 500),
        () => currentCardSetViewmodel.reset(),
      );
    }
  }

  Future<void> updateCardSet(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final currentCardSetViewmodel = context.read<CurrentCardSetViewmodel>()
        ..save();
      context
          .read<LocalCardSetsViewmodel>()
          .updateCardSet(currentCardSetViewmodel.cardSet);
      Navigator.pop(context);
    }
  }

  Future<bool> _deleteDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Wirklich löschen ?"),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("ABBRUCH"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Bestätigen"),
            ),
          ],
        );
      },
    );
  }
}
