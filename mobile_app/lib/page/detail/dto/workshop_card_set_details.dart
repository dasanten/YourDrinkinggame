import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/viewmodel/current_workshop_card_set_viewmodel.dart';

class WorkshopCardSetDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentWorkshopCardSetViewmodel>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(value.cardSet!.name!),
        ),
        body: Column(
          children: [
            Text(
                "Ersteller: ${value.cardSet?.creator?.username ?? "nicht Verfügbar"}")
          ],
        ),
      ),
    );
  }
}
