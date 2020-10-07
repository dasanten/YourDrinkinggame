import '../../models/CardSetEntity.dart';

import 'CardDto.dart';

class CardSetDto{

  String id;
  String name;
  String description;
  int favorites;
  String type;
  int version;
  bool isReported;
  int reports;
  String token;
  List<CardDto> cardList;

  CardSetDto({
      this.id,
      this.name,
      this.description,
      this.favorites,
      this.type,
      this.version,
      this.isReported,
      this.reports,
      this.token,
      this.cardList
  });

  factory CardSetDto.fromCardSetEntity(CardSetEntity cardSetEntity) => CardSetDto(
    id: cardSetEntity.workshopId,
    name: cardSetEntity.name,
    description: cardSetEntity.description,
    version: cardSetEntity.version,
    token: cardSetEntity.adminToken ?? cardSetEntity.editorToken,
  );


}