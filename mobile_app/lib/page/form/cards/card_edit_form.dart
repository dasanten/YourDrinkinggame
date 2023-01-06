import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/component/bottom_sheet/info_bottom_sheet.dart';
import 'package:your_drinking_game_app/extension/card_extension.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_set_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_viewmodel.dart';

class CardEditForm extends StatefulWidget {
  static const routeName = '/editCard';

  @override
  State<StatefulWidget> createState() => _CardEditFormState();
}

class _CardEditFormState extends State<CardEditForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cardEditable = context
        .select<CurrentCardSetViewmodel, bool>((value) => value.canBeUpdated);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Karte bearbeiten"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => InfoBottomSheet(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<CurrentCardViewmodel>(
            builder: (context, viewmodel, child) {
          return Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                _cardTypeDropdown(cardEditable),
                SizedBox(height: 8),
                _cardInput(
                    viewmodel, viewmodel.contentController, cardEditable),
                SizedBox(height: 8),
                if (viewmodel.cardType?.hasMultipleCards ?? false)
                  _cardInput(
                      viewmodel, viewmodel.relatedCardController, cardEditable),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: context.select<CurrentCardSetViewmodel, bool>(
                              (value) => value.canBeUpdated)
                          ? () async => deleteCard(context)
                          : null,
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text("Karte löschen!"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: context.select<CurrentCardSetViewmodel, bool>(
                              (value) => value.canBeUpdated)
                          ? () async => updateCard(context)
                          : null,
                      child: const Text("Karte updaten!"),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _cardTypeDropdown(bool enabled) => DropdownButtonFormField<CardType>(
        decoration: const InputDecoration(
          labelText: 'Kartentyp',
          border: OutlineInputBorder(),
        ),
        value:
            Provider.of<CurrentCardViewmodel>(context, listen: false).cardType,
        onChanged: enabled
            ? (value) =>
                Provider.of<CurrentCardViewmodel>(context, listen: false)
                    .setCardType(value)
            : null,
        items: CardType.values
            .map<DropdownMenuItem<CardType>>(
              (type) =>
                  DropdownMenuItem(value: type, child: Text(type.toString())),
            )
            .toList(),
      );

  Widget _cardInput(CurrentCardViewmodel viewmodel,
      TextEditingController controller, bool enabled) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(
            color: viewmodel.cardType?.color ?? Colors.green.shade600));
    return TextFormField(
      controller: controller,
      enabled: enabled,
      maxLines: 5,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Es muss Text festgelegt werden!";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Regel',
        enabledBorder: border,
        disabledBorder: border,
        border: OutlineInputBorder(),
      ),
      maxLength: 256,
      textInputAction: TextInputAction.next,
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
