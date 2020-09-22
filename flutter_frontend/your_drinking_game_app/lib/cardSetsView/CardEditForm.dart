import 'package:flutter/material.dart';
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
    print(_card.content);

    return Scaffold(
      appBar: AppBar(
        title: Text("Karte bearbeiten"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              // controller: _contentController,
              initialValue: _card.content,
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

  updateCard() {

  }

}