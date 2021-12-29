import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/http_service/dto/enums/token_auth.dart';
import 'package:your_drinking_game_app/http_service/token_service.dart' as TokenHttpService;

import '../../../dataBase/models/card_set_entity.dart';
import '../../../http_service/card_set_service.dart';
import '../../../http_service/dto/card_set_dto.dart';
import '../../../viewmodel/current_card_set_viewmodel.dart';
import '../../../viewmodel/local_card_sets_viewmodel.dart';

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
    CardSetEntity cardSetEntity = context.read<CurrentCardSetViewmodel>().cardSet!;
    final CardSetDto cardSetDto = CardSetDto.fromCardSetEntity(cardSetEntity)..token=_tokenCheckController.text;
    final TokenAuth tokenAuth = await TokenHttpService.getTokenType(cardSetDto);
    if(tokenAuth==TokenAuth.ADMIN)  {
      cardSetEntity = cardSetEntity.copyWith(adminToken: _tokenCheckController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Admin Token erfolgreich hinzugefügt"),
          behavior: SnackBarBehavior.floating));
    } else if (tokenAuth==TokenAuth.EDITOR) {
      cardSetEntity = cardSetEntity.copyWith(editorToken: _tokenCheckController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Editor Token erfolgreich hinzugefügt"),
          behavior: SnackBarBehavior.floating));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Token ist nicht korrenkt"),
          behavior: SnackBarBehavior.floating));
      return;
    }
    setState(() {
      context.read<CurrentCardSetViewmodel>().setCardSet(cardSetEntity);
      context
        .read<LocalCardSetsViewmodel>()
        .updateCardSet(cardSetEntity);
    });
  }

  Future<void> _checkOrUpdateAdminToken(bool isAdmin, BuildContext context, CardSetEntity cardSetEntity) async {
    if(isAdmin) {
      // CHANGE ZU BACKEND HINZUFÜGEN
      // context.read<CurrentCardSetViewmodel().adminTokenController;
    } else {
      final TokenAuth tokenAuth = await TokenHttpService.getTokenType(CardSetDto.fromCardSetEntity(cardSetEntity)..token=context.read<CurrentCardSetViewmodel>().adminTokenController.text.trim());
      if(tokenAuth==TokenAuth.ADMIN)  {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Admin Token erfolgreich hinzugefügt"),
            behavior: SnackBarBehavior.floating));
        final currentCardSetViewmodel = context.read<CurrentCardSetViewmodel>()..save();
        context
          .read<LocalCardSetsViewmodel>()
          .updateCardSet(currentCardSetViewmodel.cardSet!);

      }
    }
  }

  Future<void> _checkOrUpdateEditorToken(bool isAdmin, BuildContext context, CardSetEntity cardSetEntity) async {
    if (!isAdmin) {
      final TokenAuth tokenAuth = await TokenHttpService.getTokenType(CardSetDto.fromCardSetEntity(cardSetEntity)..token=context.read<CurrentCardSetViewmodel>().editorTokenController.text.trim());
      if(tokenAuth==TokenAuth.EDITOR)  {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Editor Token ist korrekt"),
            behavior: SnackBarBehavior.floating));
        final currentCardSetViewmodel = context.read<CurrentCardSetViewmodel>()..save();
        context
          .read<LocalCardSetsViewmodel>()
          .updateCardSet(currentCardSetViewmodel.cardSet!);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Editor Token ist nicht korrekt"),
            behavior: SnackBarBehavior.floating));
      }
    }
  }

}