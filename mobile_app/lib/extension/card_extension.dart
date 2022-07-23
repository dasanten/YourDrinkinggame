import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';

final Map<CardType, Color> _cardColorMap = {
  CardType.CLEAR: Colors.red.shade600,
};

extension CardColorExtension on CardDto {
  Color get color {
    return _cardColorMap[type] ?? Colors.green.shade600;
  }
} 