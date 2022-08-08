import 'dart:core';

import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/data_base/model/card_entity.dart';
import 'package:your_drinking_game_app/extension/card_extension.dart';
import 'package:your_drinking_game_app/services/game_service.dart' as game;

class CardDisplay extends StatefulWidget {
  static const routeName = '/CardDisplay';

  @override
  State<StatefulWidget> createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {

  CardEntity _displayedCard = CardEntity(content: "Don't drink and drive", active: true, cardSetId: null);

  @override
  void initState() {
    super.initState();
    game.loadCards();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: pickCard,
      child: Scaffold(
        backgroundColor: _displayedCard.color,
        body: Stack(
          children: [
            Positioned(
              right: 0,
              child: _editPlayer()
            ),
            Align(
              child: _displayedCardWidget(),
            ),
          ],
        )
      ),
    );
  }

  Widget _editPlayer() =>  
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: IconButton(
        iconSize: 50,
        icon: Icon(
          Icons.person_rounded,
          color: Colors.white, 
        ),
        onPressed: () => null
      ),
    );

  Widget _displayedCardWidget() => 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(_displayedCard.type?.title != null)
        Text(
          _displayedCard.type!.title!,
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          game.replacePlayerNames(_displayedCard.content),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ],
    );
  
  Future pickCard() async {
    try {
      final pickerCard = await game.pickCard();
      setState(() {
        _displayedCard = pickerCard;
      });
    } catch (e) {
      Navigator.pop(context);
    }
  }

}
