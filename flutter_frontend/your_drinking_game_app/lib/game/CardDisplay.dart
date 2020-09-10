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

  @override
  Widget build(BuildContext context) {
    _players = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text(_players.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          onTap: () {},
        )
      ),
    );
  }
}