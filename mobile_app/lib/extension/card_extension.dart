import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/data_base/model/card_entity.dart';

final Map<CardType, Color> _cardColorMap = {
  CardType.CLEAR: Colors.red.shade600,
};

extension CardColorExtension on CardDto{
  Color get color {
    return _cardColorMap[type] ?? Colors.green.shade600;
  }
} 

extension CardEntityColorExtension on CardEntity {
  Color get color {
    return _cardColorMap[type] ?? Colors.green.shade600;
  }
} 

extension CardTypeExtenionX on CardType {
  bool get hasMultipleCards => this == CardType.STANDARD || this == CardType.CLEAR || this == CardType.GAME;
}