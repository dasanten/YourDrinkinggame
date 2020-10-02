import 'package:flutter/material.dart';

import '../../../dataBase/CardSetDB.dart';
import '../../../models/CardSetEntity.dart';

class CardSetForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardSetForm();
}

class _CardSetForm extends State<CardSetForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _descriptionController;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("CardSet erstellen"),
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Beschreibung',
                border: OutlineInputBorder(),
              ),
              maxLength: 256,
            ),
            Center(
              child: RaisedButton(
                onPressed: () async => saveCardSet(context),
                child: const Text("CardSet erstellen!"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> saveCardSet(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final cardSet = CardSetEntity(
        name: _nameController.text,
        description: _descriptionController.text,
        active: true,
      );
      await CardSetDB.cardSetDB.insertCardSet(cardSet);
      Navigator.pop(context);
    }
  }
}
