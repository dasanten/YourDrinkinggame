import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/data_base/model/card_entity.dart';

import '../../data_base/repository/card_repository.dart';
import '../menu/player_input.dart';

class CardDisplay extends StatefulWidget {
  static const routeName = '/CardDisplay';

  @override
  State<StatefulWidget> createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  List<String> _players = [];
  List<CardEntity> _cards = [];
  String _displayedCard = "Don't drink and drive";

  Color backgroundColor = Colors.green;

  @override
  void initState() {
    super.initState();
    getActiveCards().then((value) => _cards = value);
  }

  @override
  Widget build(BuildContext context) {
    _players = ModalRoute.of(context)!.settings.arguments! as List<String>;

    return GestureDetector(
      onTap: updateDisplayedCard,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              _displayedCard,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateDisplayedCard() {
    final playersCopy = List<String>.from(_players);
    if (_cards.isNotEmpty) {
      final rdm = Random();
      var pickedCard = "";
      int pickedCardNum;
      do {
        if (_cards.isEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlayerInput()),
          );
          return;
        } else {
          pickedCardNum = rdm.nextInt(_cards.length);
          pickedCard = _cards[pickedCardNum].content;
          if ("#".allMatches(pickedCard).length > _players.length) {
            _cards.removeAt(pickedCardNum);
          }
        }
      } while ("#".allMatches(pickedCard).length > _players.length);

      while (pickedCard.contains("#")) {
        final pickedPlayerNum = rdm.nextInt(playersCopy.length);
        pickedCard = pickedCard.replaceFirst("#", playersCopy[pickedPlayerNum]);
        playersCopy.removeAt(pickedPlayerNum);
      }
      setState(() {
        final List<Color> colors = [Colors.red, Colors.green, Colors.deepOrange, Colors.blue, Colors.cyan];
        backgroundColor = colors[Random().nextInt(colors.length -1)];
        _displayedCard = pickedCard;
      });
      _cards.removeAt(pickedCardNum);
    } else {
      Navigator.pop(context);
    }
  }
}
