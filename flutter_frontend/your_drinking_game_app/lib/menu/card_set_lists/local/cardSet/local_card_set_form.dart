import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../../viewmodel/local_card_sets_viewmodel.dart';

class CardSetForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardSetForm();
}

class _CardSetForm extends State<CardSetForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

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
        title: const Text("Kartenset erstellen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
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
                child: ElevatedButton(
                  onPressed: () async => saveCardSet(context),
                  child: const Text("CardSet erstellen!"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveCardSet(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await context.read<LocalCardSetsViewmodel>().addCardSet(
            _nameController.text,
            _descriptionController.text,
          );
      Navigator.pop(context);
    }
  }
}
