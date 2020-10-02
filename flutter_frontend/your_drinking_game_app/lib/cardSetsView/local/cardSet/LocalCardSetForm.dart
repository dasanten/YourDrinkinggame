import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardSetEntity.dart';

class CardSetForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardSetForm();

}

class _CardSetForm extends State<CardSetForm>{

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _descriptionController;


  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController();
    _descriptionController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardSet erstellen"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if(value.isEmpty) {
                  return 'Bitte gebe einen Namen ein!';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
              maxLength: 20,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Beschreibung',
                border: OutlineInputBorder(),
              ),
              maxLength: 256,
            ),
            Center(
              child: RaisedButton(
                child: Text("CardSet erstellen!"),
                onPressed: () => saveCardSet(context),
              ),
            )
          ],
        ),
      )
    );
  }

  void saveCardSet(BuildContext context){
    if(_formKey.currentState.validate()) {
      CardSetEntity cardSet = new CardSetEntity(_nameController.text, _descriptionController.text, null, true);
      CardSetDB.cardSetDB.insertCardSet(cardSet);
      Navigator.pop(context);
    }

  }
}