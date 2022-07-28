import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/data_base/card_set_db.dart';
import 'package:your_drinking_game_app/data_base/model/card_entity.dart';
import 'package:your_drinking_game_app/data_base/model/card_set_entity.dart';
import 'package:your_drinking_game_app/page/tab/card_sets_tab_view.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_set_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/local_card_sets_viewmodel.dart';

import 'publish_card_set_form.dart';

final _formKey = GlobalKey<FormState>();

class CardSetEditForm extends StatefulWidget {
  static const routeName = '/editCardSet';



  @override
  State<StatefulWidget> createState() => _CardSetEditFormState();

}

class _CardSetEditFormState extends State<CardSetEditForm> {

  bool published = false;
  bool editable = false;

  @override
  Widget build(BuildContext context) {
    published = context.read<CurrentCardSetViewmodel>().cardSet?.workshopId?.isNotEmpty ?? false;
    // editable = context.select<CurrentCardSetViewmodel, bool>((value) => value.isAdmin || value.isEditor);
    return Scaffold(
      appBar: AppBar(
        title: Consumer<CurrentCardSetViewmodel>(
          builder: (context, viewmodel, child) => Text(
            "Kartenset ${viewmodel.cardSet!.name} bearbeiten",
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
                readOnly: !editable,
                controller: context
                    .select<CurrentCardSetViewmodel, TextEditingController>(
                  (v) => v.nameController,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Bitte gebe einen Namen ein!';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                maxLength: 25,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
              TextFormField(
                readOnly: !editable,
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
              context.select<CurrentCardSetViewmodel, SwitchListTile>((value) =>
                SwitchListTile(
                  title: const Text("Kartenset veröffentlicht"),
                  value: published, 
                  onChanged: editable ? (_) async {
                    if (published) {
                      // if(value.isAdmin) {
                      //   // card_set_http.deleteCardSet(value.cardSet!.workshopId!, value.cardSet!.adminToken!);
                      //   // TODO add deletes
                      //   final CardSetEntity cardSetEntity = value.cardSet!.copyWith(workshopId: "");
                      //   value.setCardSet(cardSetEntity);
                      //   context
                      //     .read<LocalCardSetsViewmodel>()
                      //     .updateCardSet(cardSetEntity);
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text("Kartenset ${value.cardSet!.name} veröffentlichung rückgängig gemacht"),
                      //       behavior: SnackBarBehavior.floating,
                      //     ),
                      //   );
                      // } else if(value.isEditor) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content: Text("Nur Besitzer können ein Set löschen!"),
                      //       behavior: SnackBarBehavior.floating,
                      //     ),
                      //   );
                      // }
                    } else {
                      final String token = await _publishDialog(context);
                      if (token.isNotEmpty && value.cardSet != null) {
                        // TODO add cardset 
                        // final CardSetDto cardSetDto = await card_set_http.addCardSet(CardSetDto.fromCardSetEntity(value.cardSet!.copyWith(adminToken: token)));
                        // if(value.cards.isNotEmpty) {
                        //   final List<CardDto> cardList = value.cards.map<CardDto>((card) => CardDto.fromCardEntity(card, cardSetDto.id)).toList();
                        //   card_set_http.addCards(cardList, token);
                        // }
                        // final CardSetEntity newCardSet = value.cardSet!.copyWith(adminToken: cardSetDto.token, workshopId: cardSetDto.id);  
                        // value.setCardSet(newCardSet);
                        // context
                        //   .read<LocalCardSetsViewmodel>()
                        //   .updateCardSet(value.cardSet!);
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text("Kartenset ${newCardSet.name} veröffentlicht"),
                        //     behavior: SnackBarBehavior.floating,
                        //   ),
                        // );
                      }
                    }
                  }: null
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.settings),
                onPressed: published ? () => Navigator.push(context, MaterialPageRoute(builder: (context) => PublishCardSetForm())): null,
                label: const Text("Workshop einstellungen"),
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
                    onPressed: editable ? () async => updateCardSet(context): null,
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
            currentCardSetViewmodel.cardSet!.id!,
          );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Kartenset ${currentCardSetViewmodel.cardSet!.name} gelöscht"),
          behavior: SnackBarBehavior.floating,
        ),
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
    if (_formKey.currentState!.validate()) {
      final currentCardSetViewmodel = context.read<CurrentCardSetViewmodel>()
        ..save();
      context
        .read<LocalCardSetsViewmodel>()
        .updateCardSet(currentCardSetViewmodel.cardSet!);
      if(published) {
        // TODO update cardset
        // final String token = currentCardSetViewmodel.cardSet!.adminToken!.isNotEmpty ? currentCardSetViewmodel.cardSet!.adminToken!: currentCardSetViewmodel.cardSet!.editorToken!;
        // card_set_http.editCardSet(CardSetDto.fromCardSetEntity(currentCardSetViewmodel.cardSet!), token);
        // final List<CardEntity> cards = currentCardSetViewmodel.cards; 
        // if(cards.isNotEmpty) {
        //   final List<CardDto> cardDtoList = await card_set_http.updateCards(cards.map<CardDto>((e) => CardDto.fromCardEntity(e, currentCardSetViewmodel.cardSet!.workshopId!)).toList(), token);
        //   cardDtoList.forEach((element) { 
        //     final CardEntity card = cards.firstWhere((card) => card.content==element.content).copyWith(workshopId: element.id);
        //     CardSetDB.cardSetDB.updateCard(card);
          
        //   });
        // }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Kartenset ${currentCardSetViewmodel.cardSet!.name} geupdated"),
          behavior: SnackBarBehavior.floating,
        ),
      );
      Navigator.pop(context);
    }
  }

  Future<bool> _deleteDialog(BuildContext context) async {
    return await showDialog<bool?>(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              title: const Text("Wirklich löschen?"),
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
        ) ??
        false;
  }

  Future<String> _publishDialog(BuildContext context) async {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController textEditingController = TextEditingController();
    return await showDialog<String?>(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
        AlertDialog(
          title: const Text("Wirklich veröffentlichen?"),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                labelText: 'Neuer Admin Token',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Bitte gebe einen Token ein!';
                }
                return null;
              },
              maxLength: 20,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () =>  
                Navigator.pop(context, null),
              child: const Text("ABBRUCH"),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pop(context, textEditingController.text.trim());
                }
              },
              child: const Text("Bestätigen"),
            ),
          ],
        )
    ) ?? "";
  }
}
