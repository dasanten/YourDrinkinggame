import 'package:flutter/foundation.dart';

import '../dataBase/CardSetDB.dart';

@immutable
class CardSetEntity {
  final int id;
  final String name;
  final String description;
  final String workshopId;
  final bool active;

  const CardSetEntity({
    this.id,
    this.workshopId,
    @required this.name,
    @required this.description,
    @required this.active,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        CardSetDB.COLUMN_CARD_SET_NAME: name,
        CardSetDB.COLUMN_CARD_SET_DESCRIPTION: description,
        CardSetDB.COLUMN_CARD_SET_ACTIVE: active ? 1 : 0,
        if (id != null) CardSetDB.COLUMN_CARD_SET_ID: id,
      };

  factory CardSetEntity.fromMap(Map<String, dynamic> cardSetMap) =>
      CardSetEntity(
        id: cardSetMap[CardSetDB.COLUMN_CARD_SET_ID] as int,
        name: cardSetMap[CardSetDB.COLUMN_CARD_SET_NAME] as String,
        description:
            cardSetMap[CardSetDB.COLUMN_CARD_SET_DESCRIPTION] as String,
        workshopId: cardSetMap[CardSetDB.COLUMN_CARD_SET_WORKSHOP_ID] as String,
        active: cardSetMap[CardSetDB.COLUMN_CARD_SET_ACTIVE] == 1,
      );

  CardSetEntity copyWith({
    int id,
    bool active,
    String name,
    String description,
    String workshopId,
  }) =>
      CardSetEntity(
        name: name ?? this.name,
        description: description ?? this.description,
        active: active ?? this.active,
        id: id ?? this.id,
        workshopId: workshopId ?? this.workshopId,
      );
}
