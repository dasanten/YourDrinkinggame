import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Kartenset "+ _cardSet.name +" bearbeiten"),
      ),
      body: Form(
          child: Column(
            children: [
              TextFormField(
                initialValue: _cardSet.name,
              )
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
}