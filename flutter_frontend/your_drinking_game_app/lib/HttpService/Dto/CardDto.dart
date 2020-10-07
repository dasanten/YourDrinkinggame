import '../../models/CardEntity.dart';

class CardDto {

  String id;
  String cardSetId;
  String content;
  String type;
  bool isReported;
  int reports;

  CardDto({
      this.id,
      this.cardSetId,
      this.content,
      this.type,
      this.isReported,
      this.reports
  });

  factory CardDto.fromCardEntity(CardEntity cardEntity, String cardSetId) => CardDto(
    id: cardEntity.workshopId,
    content: cardEntity.content,
    cardSetId: cardSetId
  );

}