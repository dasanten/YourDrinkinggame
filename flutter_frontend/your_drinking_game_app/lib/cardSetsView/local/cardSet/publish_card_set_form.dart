import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/current_card_set_viewmodel.dart';

class PublishCardSetForm extends StatelessWidget {
  static const routeName = '/publishCardSet';

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
      body: Consumer<CurrentCardSetViewmodel>(
        builder: (context, viewmodel, child) => 
          Row(
            children: [
              Text(viewmodel.cardSet!.name),
            ],
          )
      ),
    );
  }

}