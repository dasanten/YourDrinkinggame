import 'package:flutter/material.dart';

import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardEntity.dart';
import 'package:your_drinking_game_app/models/CardSetEntity.dart';

class LocalCardForm extends StatefulWidget {
  static const routeName = '/CreateLocalCard';

  @override
  State<StatefulWidget> createState() => _LocalCardForm();
}

class _LocalCardForm extends State<LocalCardForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _contentController;
  CardSetEntity _cardSet;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _cardSet = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Karte für ${_cardSet.name}"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            TextFormField(
              controller: _contentController,
              validator: (value) {
                if (value.isEmpty) {
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
            Center(
              child: RaisedButton(
                onPressed: () async => saveCard(context),
                child: const Text("Karte hinzufügen!"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveCard(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final card = CardEntity(
        active: true,
        cardSetId: _cardSet.id,
        content: _contentController.text,
      );
      await CardSetDB.cardSetDB.insertCard(card);
      Navigator.pop(context);
    }
  }
}
