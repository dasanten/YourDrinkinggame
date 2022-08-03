import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/data_base/model/card_entity.dart';

final Map<CardType, Color> _cardColorMap = {
  CardType.CLEAR: Colors.red.shade600,
  CardType.GAME: Colors.blue.shade600,
  CardType.LATER: Colors.purple.shade600,
  CardType.NEXT: Colors.orange.shade600,
};

final Map<CardType, Icon> _cardIconMap = {
  CardType.STANDARD: Icon(Icons.remove_red_eye),
  CardType.CLEAR: Icon(Icons.clear),
  CardType.GAME: Icon(Icons.games),
  CardType.LATER: Icon(Icons.access_time),
  CardType.NEXT: Icon(Icons.arrow_forward),
};

final Map<CardType, String> _cardDescriptionMap = {
  CardType.STANDARD: "Diese Kartenart zeigt eine Karte an, ersetzt die Spielernamen und färbt diese Grün",
  CardType.CLEAR: "Es wird über der Karte ein die Überschrift \"Ex\" anzeigt",
  CardType.GAME: "Es wird über der Karte ein die Überschrift \"Spiel\" anzeigt",
  CardType.LATER: "Diese Karte besteht aus zwei Regeln. Die zweite Karte wird zu einem zufälligen zuküntigen Zeitpunkt angezeigt",
  CardType.NEXT: "Diese Karte besteht aus zwei Regeln. Die zweite Karte wird direkt nach der ersten Karte angezeigt",
};

final Map<CardType, String> _titleMap = {
  CardType.CLEAR: "Ex",
  CardType.GAME: "Spiel",
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
  bool get hasMultipleCards => !(this == CardType.STANDARD || this == CardType.CLEAR || this == CardType.GAME);

  Color get color => _cardColorMap[this] ?? Colors.green.shade600;

  String get description => _cardDescriptionMap[this] ?? "";

  Icon get icon => _cardIconMap[this] ?? Icon(Icons.remove_red_eye);

  String? get title => _titleMap[this];
  
}