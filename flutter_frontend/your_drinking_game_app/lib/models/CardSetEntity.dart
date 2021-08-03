import 'package:flutter/foundation.dart';

import '../dataBase/CardSetDB.dart';
import '../http_service/dto/CardSetDto.dart';

@immutable
class CardSetEntity {
  final int? id;
  final String name;
  final String description;
  final int? version;
  final String? editorToken;
  final String? adminToken;
  final String? workshopId;
  final bool active;

  const CardSetEntity({
    this.id,
    this.workshopId,
    this.version,
    this.editorToken,
    this.adminToken,
    required this.name,
    required this.description,
    required this.active,
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
      );

  factory CardSetEntity.fromCardSetDto(CardSetDto cardSetDto) => CardSetEntity(
      name: cardSetDto.name,
      description: cardSetDto.description,
      active: true,
      version: cardSetDto.version,
      workshopId: cardSetDto.id
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
      );

  @override
  String toString() => 'CardSetEntity(name: $name, '
                       'description: $description, '
                       'version: $version, '
                       'adminToken: $adminToken'
                       'editorToken: $editorToken, '
                       'active: $active, '
                       'id: $id, '
                       'workshopId: $workshopId)';
}
