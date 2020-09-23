import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';
import 'package:your_drinking_game_app/models/CardEntity.dart';

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
  Widget build(BuildContext context) {
    _card = ModalRoute.of(context).settings.arguments;
    _contentController.text = _card.content;

    return Scaffold(
      appBar: AppBar(
        title: Text("Karte bearbeiten"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            TextFormField(
              controller: _contentController,
              maxLines: 5,
              validator: (value) {
                if(value.isEmpty) {
                  return "Es muss Text festgelegt werden!";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Regel',
                border: OutlineInputBorder(),
              ),
              maxLength: 256,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Karte löschen!"),
                  onPressed: ()=> deleteCard(context),
                  color: Colors.red,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                RaisedButton(
                  child: Text("Karte updaten!"),
                  onPressed: ()=> updateCard(context),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _contentController = new TextEditingController();
  }

  updateCard(BuildContext context) {
    if(_formKey.currentState.validate()) {
      _card.content = _contentController.text;
      CardSetDB.cardSetDB.updateCard(_card);
      Navigator.pop(context);
    }
  }

  deleteCard(BuildContext context) async{
    bool confirmed = await _deleteDialog();
    if(confirmed) {
      CardSetDB.cardSetDB.deleteCard(_card.id);
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