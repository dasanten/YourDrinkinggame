import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/main.dart';
import 'package:your_drinking_game_app/models/CardSetEntity.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text("Karte löschen!"),
                    onPressed: ()=> deleteCardSet(context),
                    color: Colors.red,
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  RaisedButton(
                    child: Text("Karte updaten!"),
                    onPressed: ()=> updateCardSet(context),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController();
    _descriptionController = new TextEditingController();
  }

  deleteCardSet(BuildContext context) async{
    bool confirmed = await _deleteDialog();
    if(confirmed) {
      CardSetDB.cardSetDB.deleteCardSet(_cardSet.id);
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  updateCardSet(BuildContext context) {
    if(_formKey.currentState.validate()) {
      _cardSet
          ..name = _nameController.text
          ..description = _descriptionController.text;
      CardSetDB.cardSetDB.updateCardSet(_cardSet);
      Navigator.pop(context);
    }
  }

  Future<bool> _deleteDialog() async{
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Wirklich löschen ?"),
            actions: [
              RaisedButton(
                child: Text("Abbruch".toUpperCase()),
                onPressed: ()=> Navigator.pop(context, false),
              ),
              RaisedButton(
                child: Text("Bestätigen".toUpperCase()),
                onPressed: ()=> Navigator.pop(context, true),
              ),
            ],
          );
        }
    );
  }

}