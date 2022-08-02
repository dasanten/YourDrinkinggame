import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/component/bottom_sheet/info_bottom_sheet.dart';
import 'package:your_drinking_game_app/extension/card_extension.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_set_viewmodel.dart';

class LocalCardForm extends StatefulWidget {
  static const routeName = '/CreateLocalCard';

  @override
  State<StatefulWidget> createState() => _LocalCardForm();
}

class _LocalCardForm extends State<LocalCardForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _contentController;
  late TextEditingController _relatedCardController;
  CardType? _cardType = CardType.STANDARD;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController();
    _relatedCardController = TextEditingController();
  }

  @override
  void dispose() {
    _contentController.dispose();
    _relatedCardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Karte für ${context.watch<CurrentCardSetViewmodel>().cardSet!.name}",
        ),
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
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _cardTypeDropdown(),
                  SizedBox(height: 8),
                  _cardInput(_contentController ),
                  SizedBox(height: 8),
                  if (_cardType?.hasMultipleCards ?? false)
                  _cardInput(_relatedCardController),
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

  Widget _cardTypeDropdown() =>
    DropdownButtonFormField<CardType>(
      decoration: const InputDecoration(
        labelText: 'Kartentyp',
        border: OutlineInputBorder(),
      ),
      value: _cardType,
      onChanged: (value) => setState(() => _cardType = value),
      items: CardType.values.map<DropdownMenuItem<CardType>>((type) => 
        DropdownMenuItem(
          value: type,
          child: Text(type.toString())
        ),
      ).toList(),
    );
  

  Widget _cardInput(TextEditingController controller) { 
    final border = OutlineInputBorder(borderSide: BorderSide(color: _cardType?.color ?? Colors.green.shade600));                
    return TextFormField(
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
        enabledBorder: border,
        disabledBorder: border,
        border: OutlineInputBorder(),
        fillColor: _cardType?.color,
      ),
      maxLength: 256,
      textInputAction: TextInputAction.next,
    );
  }

  Future<void> saveCard(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await context
          .read<CurrentCardSetViewmodel>()
          .insertCardFromContent(_contentController.text, _relatedCardController.text, _cardType);
      Navigator.pop(context);
    }
  }
}
