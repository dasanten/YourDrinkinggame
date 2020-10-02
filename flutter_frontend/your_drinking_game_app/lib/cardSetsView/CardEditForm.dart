import 'package:flutter/material.dart';

import '../dataBase/CardSetDB.dart';
import '../models/CardEntity.dart';

class CardEditForm extends StatefulWidget {
  static const routeName = '/editCard';

  @override
  State<StatefulWidget> createState() => _CardEditForm();
}

class _CardEditForm extends State<CardEditForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _contentController;
  CardEntity _card;

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
    _card = ModalRoute.of(context).settings.arguments;
    _contentController.text = _card.content;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Karte bearbeiten"),
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
              maxLines: 5,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () async => deleteCard(context),
                  color: Colors.red,
                  child: const Text("Karte löschen!"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                RaisedButton(
                  onPressed: () async => updateCard(context),
                  child: const Text("Karte updaten!"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateCard(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _card = _card.copyWith(content: _contentController.text);
      await CardSetDB.cardSetDB.updateCard(_card);
      Navigator.pop(context);
    }
  }

  Future<void> deleteCard(BuildContext context) async {
    final confirmed = await _deleteDialog();
    if (confirmed) {
      await CardSetDB.cardSetDB.deleteCard(_card.id);
      Navigator.pop(context);
    }
  }

  Future<bool> _deleteDialog() async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Wirklich löschen ?"),
          actions: [
            RaisedButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("ABBRUCH"),
            ),
            RaisedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("BESTÄTIGEN"),
            ),
          ],
        );
      },
    );
  }
}
