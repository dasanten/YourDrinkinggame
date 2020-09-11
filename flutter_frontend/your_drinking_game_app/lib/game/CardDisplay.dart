import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/dataBase/MockCards.dart';

class CardDisplay extends StatefulWidget {
  static const routeName = '/CardDisplay';

  @override
  State<StatefulWidget> createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {

  List<String> _players = [];
  String _displayedCard;

  @override
  Widget build(BuildContext context) {
    _players = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            child: Text(_displayedCard,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            onTap: () => updateDisplayedCard(),
          ),
        ),
      ),
    );
  }



  List<String> _cards = MockCards.cards;

  updateDisplayedCard() {

    setState(() {
      var rdm = new Random();
      String pickedCard = _cards[rdm.nextInt(_cards.length)];
      while(pickedCard.contains("#")) {
        _displayedCard = pickedCard.replaceFirst("#", _players[rdm.nextInt(_players.length)]);
      }
      _cards.remove(pickedCard);
    });
  }
}