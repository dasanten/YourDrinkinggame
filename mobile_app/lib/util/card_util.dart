import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';

Map<CardType, Color> _cardColorMap = {
  CardType.CLEAR: Colors.red.shade600,
};

Color getColorOfType(CardType? cardType) {
  return _cardColorMap[cardType] ?? Colors.green.shade600;
} 