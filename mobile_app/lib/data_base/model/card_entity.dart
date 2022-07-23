import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/data_base/db_namings.dart' as CardSetDB;

@immutable
class CardEntity {
  final int? id;
  final String content;
  final bool active;
  final String? workshopId;
  final CardType? type;
  final int cardSetId;

  const CardEntity({
    this.id,
    this.workshopId,
    this.type,
    required this.content,
    required this.active,
    required this.cardSetId,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        CardSetDB.COLUMN_CARD_CONTENT: content,
        CardSetDB.COLUMN_CARD_ACTIVE: active ? 1 : 0,
        CardSetDB.COLUMN_CARD_WORKSHOP_ID: workshopId,
        CardSetDB.COLUMN_CARD_CARD_SET_ID: cardSetId,
        if (id != null) CardSetDB.COLUMN_CARD_ID: id,
      };

  factory CardEntity.fromMap(Map<String, dynamic> map) => CardEntity(
        id: map[CardSetDB.COLUMN_CARD_ID] as int?,
        content: map[CardSetDB.COLUMN_CARD_CONTENT] as String,
        active: map[CardSetDB.COLUMN_CARD_ACTIVE] as int == 1,
        workshopId: map[CardSetDB.COLUMN_CARD_WORKSHOP_ID] as String?,
        cardSetId: map[CardSetDB.COLUMN_CARD_CARD_SET_ID] as int,
      );

  factory CardEntity.fromCardDto(CardDto cardDto, int cardSetId) => CardEntity(
      content: cardDto.content!,
      active: true,
      cardSetId: cardSetId,
      workshopId: cardDto.id,
      type: cardDto.type
  );

  CardEntity copyWith({
    int ?id,
    String ?content,
    bool ?active,
    String? workshopId,
    CardType? cardType,
  }) =>
    CardEntity(
      content: content ?? this.content,
      active: active ?? this.active,
      cardSetId: cardSetId,
      id: id ?? this.id,
      workshopId: workshopId ?? this.workshopId,
      type: cardType ?? this.type
    );
}
