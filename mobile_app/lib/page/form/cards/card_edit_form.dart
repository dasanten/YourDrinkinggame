import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/extension/card_extension.dart';
import 'package:your_drinking_game_app/viewmodel/async_viewmodel_base.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_set_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_viewmodel.dart';

final _formKey = GlobalKey<FormState>();

class CardEditForm extends StatefulWidget {
  static const routeName = '/editCard';
  
  @override
  State<StatefulWidget> createState() => _CardEditFormState();
}


class _CardEditFormState extends State<CardEditForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Karte bearbeiten"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<CurrentCardViewmodel>(
          builder: (context, viewmodel, child) {
            return Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  _cardTypeDropdown(),
                  SizedBox(height: 8),
                  _cardInput(viewmodel, viewmodel.contentController),
                  SizedBox(height: 8),
                  if (viewmodel.cardType?.hasMultipleCards ?? false)
                  _cardInput(viewmodel, viewmodel.relatedCardController),
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
            );
          }
        ),
      ),
    );
  }

  Widget _cardTypeDropdown() =>
    DropdownButtonFormField<CardType>(
      decoration: const InputDecoration(
        labelText: 'Kartentyp',
        border: OutlineInputBorder(),
      ),
      value: Provider.of<CurrentCardViewmodel>(context, listen: false).cardType,
      onChanged: (value) => Provider.of<CurrentCardViewmodel>(context, listen: false).setCardType(value),
      items: CardType.values.map<DropdownMenuItem<CardType>>((type) => 
        DropdownMenuItem(
          value: type,
          child: Text(type.toString())
        ),
      ).toList(),
    );
  

  Widget _cardInput(CurrentCardViewmodel viewmodel, TextEditingController controller) =>                   
    TextFormField(
      controller: controller,
      maxLines: 5,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Es muss Text festgelegt werden!";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Regel',
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: viewmodel.cardType?.color ?? Colors.green.shade600)),
        border: OutlineInputBorder(),
        fillColor: viewmodel.cardType?.color,
      ),
      maxLength: 256,
      textInputAction: TextInputAction.next,
    );

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
