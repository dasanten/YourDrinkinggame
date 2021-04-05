import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../viewmodel/current_card_set_viewmodel.dart';

class LocalCardForm extends StatefulWidget {
  static const routeName = '/CreateLocalCard';

  @override
  State<StatefulWidget> createState() => _LocalCardForm();
}

class _LocalCardForm extends State<LocalCardForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _contentController;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Karte für ${context.watch<CurrentCardSetViewmodel>().cardSet.name}",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                child: ElevatedButton(
                  onPressed: () async => saveCard(context),
                  child: const Text("Karte hinzufügen!"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveCard(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      await context
          .read<CurrentCardSetViewmodel>()
          .insertCardFromContent(_contentController.text);
      Navigator.pop(context);
    }
  }
}
