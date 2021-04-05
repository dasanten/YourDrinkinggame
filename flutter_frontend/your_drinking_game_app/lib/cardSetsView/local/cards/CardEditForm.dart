import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../viewmodel/current_card_set_viewmodel.dart';
import '../../../viewmodel/current_card_viewmodel.dart';

final _formKey = GlobalKey<FormState>();

class CardEditForm extends StatelessWidget {
  static const routeName = '/editCard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Karte bearbeiten"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller:
                    context.select<CurrentCardViewmodel, TextEditingController>(
                  (v) => v.contentController,
                ),
                maxLines: 5,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Es muss Text festgelegt werden!";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Regel',
                  border: OutlineInputBorder(),
                ),
                maxLength: 256,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async => deleteCard(context),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: const Text("Karte löschen!"),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  ElevatedButton(
                    onPressed: () async => updateCard(context),
                    child: const Text("Karte updaten!"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateCard(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final currentCardViewmodel = context.read<CurrentCardViewmodel>()..save();
      await context.read<CurrentCardSetViewmodel>().updateCard(
            currentCardViewmodel.card!,
          );
      Navigator.pop(context);
    }
  }

  Future<void> deleteCard(BuildContext context) async {
    final confirmed = await _deleteDialog(context);
    if (confirmed) {
      final currentCardViewmodel = context.read<CurrentCardViewmodel>();
      await context
          .read<CurrentCardSetViewmodel>()
          .deleteCard(currentCardViewmodel.card!.id!);
      Navigator.pop(context);
      Future.delayed(
        const Duration(milliseconds: 500),
        () => currentCardViewmodel.reset(),
      );
    }
  }

  Future<bool> _deleteDialog(BuildContext context) async {
    return await showDialog<bool?>(
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
                  child: const Text("BESTÄTIGEN"),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
