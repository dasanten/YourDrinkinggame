import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/data_base/models/card_set_entity.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_set_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/local_card_sets_viewmodel.dart';

class PublishCardSetForm extends StatefulWidget {
  static const routeName = '/publishCardSet';

  @override
  State<StatefulWidget> createState() => _PublishCardSetFormState();

}

class _PublishCardSetFormState extends State<PublishCardSetForm> {

  final TextEditingController _tokenCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<CurrentCardSetViewmodel>(
          builder: (context, viewmodel, child) => Text(
            "${viewmodel.cardSet!.name} workshop Einstellungen",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          child: ListView(
            children: context.select<CurrentCardSetViewmodel, List<Widget>>((value) => 
              (value.isEditor || value.isAdmin) ? [
                TextFormField(
                  controller: value.adminTokenController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Bitte gebe einen Token ein!';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Admin Token',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 12,  
                ),
                ElevatedButton.icon(
                  onPressed: () async => _checkOrUpdateAdminToken(value.isAdmin, context, value.cardSet!), 
                  icon: const Icon(Icons.check), 
                  label: Text(value.isAdmin ? "Token ändern": "Token überprüfen")
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                ),
                TextFormField(
                  controller: value.editorTokenController,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Bitte gebe einen Token ein!';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Editor Token',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 12,  
                ),
                ElevatedButton.icon(
                  onPressed: () async => _checkOrUpdateEditorToken(value.isAdmin, context, value.cardSet!), 
                  icon: const Icon(Icons.check), 
                  label: Text(value.isAdmin ? "Token ändern": "Token überprüfen")
                ),
              ]: noTokenWidgets()),
              
          )
        ),
      )
        
    );
  }


  List<Widget> noTokenWidgets() => 
    <Widget>[
      TextFormField(
        controller: _tokenCheckController,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'Bitte gebe einen Token ein!';
          }
          return null;
        },
        decoration: const InputDecoration(
          labelText: 'Token',
          border: OutlineInputBorder(),
        ),
        maxLength: 12,
      ),
      ElevatedButton(
        onPressed: () async => getTokenType(context), 
        child: const Text("Token überprüfen")
      )
    ];


  Future getTokenType(BuildContext context) async {

  }

  Future<void> _checkOrUpdateAdminToken(bool isAdmin, BuildContext context, CardSetEntity cardSetEntity) async {
  }

  Future<void> _checkOrUpdateEditorToken(bool isAdmin, BuildContext context, CardSetEntity cardSetEntity) async {

  }

}