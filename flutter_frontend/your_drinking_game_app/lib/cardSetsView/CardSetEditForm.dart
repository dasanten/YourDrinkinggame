import 'package:flutter/material.dart';

import '../dataBase/CardSetDB.dart';
import '../models/CardSetEntity.dart';

class CardSetEditForm extends StatefulWidget {
  static const routeName = '/editCardSet';

  @override
  State<StatefulWidget> createState() => _CardSetEditForm();
}

class _CardSetEditForm extends State<CardSetEditForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _descriptionController;
  CardSetEntity _cardSet;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _cardSet = ModalRoute.of(context).settings.arguments;
    _nameController.text = _cardSet.name;
    _descriptionController.text = _cardSet.description;

    return Scaffold(
      appBar: AppBar(
        title: Text("Kartenset ${_cardSet.name} bearbeiten"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            TextFormField(
              controller: _nameController,
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
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Beschreibung',
                border: OutlineInputBorder(),
              ),
              maxLength: 256,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () => deleteCardSet(context),
                  color: Colors.red,
                  child: const Text("Karte löschen!"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
                RaisedButton(
                  onPressed: () => updateCardSet(context),
                  child: const Text("Karte updaten!"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> deleteCardSet(BuildContext context) async {
    final confirmed = await _deleteDialog();
    if (confirmed) {
      CardSetDB.cardSetDB.deleteCardSet(_cardSet.id);
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  Future<void> updateCardSet(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      _cardSet = _cardSet.copyWith(
        name: _nameController.text,
        description: _descriptionController.text,
      );
      await CardSetDB.cardSetDB.updateCardSet(_cardSet);
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
              child: const Text("Bestätigen"),
            ),
          ],
        );
      },
    );
  }
}
