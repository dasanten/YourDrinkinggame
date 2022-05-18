import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/foundation.dart';

import '../card_set_db.dart';

@immutable
class CardSetEntity {
  final int? id;
  final String name;
  final String description;
  final String? category;
  final int? version;
  final String? editorToken;
  final String? adminToken;
  final String? workshopId;
  final bool active;
  final bool nsfw;

  const CardSetEntity({
    this.id,
    this.workshopId,
    this.version,
    this.editorToken,
    this.adminToken,
    this.category,
    required this.name,
    required this.description,
    required this.active,
    required this.nsfw,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        CardSetDB.COLUMN_CARD_SET_NAME: name,
        CardSetDB.COLUMN_CARD_SET_DESCRIPTION: description,
        CardSetDB.COLUMN_CARD_SET_ACTIVE: active ? 1 : 0,
        CardSetDB.COLUMN_CARD_SET_VERSION: version,
        CardSetDB.COLUMN_CARD_SET_ADMIN_TOKEN: adminToken,
        CardSetDB.COLUMN_CARD_SET_EDITOR_TOKEN: editorToken,
        CardSetDB.COLUMN_CARD_SET_WORKSHOP_ID: workshopId,
        if (id != null) CardSetDB.COLUMN_CARD_SET_ID: id,
      };

  factory CardSetEntity.fromMap(Map<String, dynamic> cardSetMap) =>
      CardSetEntity(
        id: cardSetMap[CardSetDB.COLUMN_CARD_SET_ID] as int?,
        name: cardSetMap[CardSetDB.COLUMN_CARD_SET_NAME] as String,
        version: cardSetMap[CardSetDB.COLUMN_CARD_SET_VERSION] as int?,
        adminToken: cardSetMap[CardSetDB.COLUMN_CARD_SET_ADMIN_TOKEN] as String?,
        editorToken: cardSetMap[CardSetDB.COLUMN_CARD_SET_EDITOR_TOKEN] as String?,
        description:
            cardSetMap[CardSetDB.COLUMN_CARD_SET_DESCRIPTION] as String,
        workshopId: cardSetMap[CardSetDB.COLUMN_CARD_SET_WORKSHOP_ID] as String?,
        active: cardSetMap[CardSetDB.COLUMN_CARD_SET_ACTIVE] == 1,
        nsfw: false
      );

  factory CardSetEntity.fromCardSetDto(CardSetDto cardSetDto) => CardSetEntity(
      name: cardSetDto.name!,
      description: cardSetDto.description!,
      active: true,
      version: cardSetDto.version as int,
      workshopId: cardSetDto.id,
      category: cardSetDto.category,
      nsfw: false,
  );


  CardSetEntity copyWith({
    int? id,
    int? version,
    String? adminToken,
    String? editorToken,
    bool? active,
    String? name,
    String? description,
    String? workshopId,
    String? category,
  }) =>
      CardSetEntity(
        name: name ?? this.name,
        description: description ?? this.description,
        version: version ?? this.version,
        adminToken: adminToken ?? this.adminToken,
        editorToken: editorToken ?? this.editorToken,
        active: active ?? this.active,
        id: id ?? this.id,
        workshopId: workshopId ?? this.workshopId,
        category: category ?? this.category,
        nsfw: false
      );

  @override
  String toString() => 'CardSetEntity(name: $name, '
                       'description: $description, '
                       'version: $version, '
                       'adminToken: $adminToken'
                       'editorToken: $editorToken, '
                       'active: $active, '
                       'category: $category'
                       'id: $id, '
                       'workshopId: $workshopId)';
}
