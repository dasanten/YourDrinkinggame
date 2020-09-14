import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/dataBase/MockCards.dart';
import 'package:your_drinking_game_app/main.dart';

class CardDisplay extends StatefulWidget {
  static const routeName = '/CardDisplay';

  @override
  State<StatefulWidget> createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {

  List<String> _players = [];
  String _displayedCard = "Don't drink and drive";


  @override
  Widget build(BuildContext context) {
    _players = ModalRoute.of(context).settings.arguments;

    return GestureDetector(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(_displayedCard,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      onTap: () => updateDisplayedCard(),
    );


  }


  @override
  void initState() {
    super.initState();
    MockCards mockCards = new MockCards();
    _cards = mockCards.cards;
  }

  List<String> _cards = [];

  updateDisplayedCard() {
    List<String> playersCopy = List.from(_players);
    if(_cards.isNotEmpty) {
      var rdm = new Random();
      String pickedCard = "";
      int pickedCardNum;
      do {
        if(_cards.isEmpty) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
          return;
        } else {
          pickedCardNum = rdm.nextInt(_cards.length);
          pickedCard = _cards[pickedCardNum];
          if ("#".allMatches(pickedCard).length > _players.length) {
            _cards.removeAt(pickedCardNum);
          }
        }
      } while("#".allMatches(pickedCard).length > _players.length);

      while(pickedCard.contains("#")) {
        int pickedPlayerNum = rdm.nextInt(playersCopy.length);
        pickedCard = pickedCard.replaceFirst("#", playersCopy[pickedPlayerNum]);
        playersCopy.removeAt(pickedPlayerNum);
      }
      setState(() {
        _displayedCard = pickedCard;
      });
      _cards.removeAt(pickedCardNum);
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
    }

  }
}