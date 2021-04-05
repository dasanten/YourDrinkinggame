import '../../models/CardSetEntity.dart';

import 'CardDto.dart';

class CardSetDto {
  String id;
  String name;
  String description;
  int? favorites;
  String? type;
  int version;
  bool? isReported;
  int? reports;
  String? token;
  List<CardDto> cardList;

  CardSetDto({
    required this.id,
    required this.name,
    required this.description,
    this.favorites,
    this.type,
    required this.version,
    this.isReported,
    this.reports,
    this.token,
    List<CardDto>? cardList,
  }) : cardList = cardList ?? <CardDto>[];

  factory CardSetDto.fromCardSetEntity(CardSetEntity cardSetEntity) =>
      CardSetDto(
        id: cardSetEntity.workshopId ?? '',
        name: cardSetEntity.name,
        description: cardSetEntity.description,
        version: cardSetEntity.version ?? 0,
        token: cardSetEntity.adminToken ?? cardSetEntity.editorToken ?? '',
      );

  factory CardSetDto.fromJson(Map<String, dynamic> json) {
    return CardSetDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      favorites: json['favorites'] as int?,
      type: json['type'] as String?,
      version: json['version'] as int,
      isReported: json['reported'] as bool?,
      reports: json['reports'] as int?,
      token: json['token'] as String?,
      cardList: (json['cardList'] as List)
          .map<CardDto>(
            (j) => CardDto.fromJson(j as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'favorites': favorites,
        'type': type,
        'version': version,
        'isReported': isReported,
        'reports': reports,
        'token': token,
        'cardList': cardList.map((e) => e.toJson())
      };
}
