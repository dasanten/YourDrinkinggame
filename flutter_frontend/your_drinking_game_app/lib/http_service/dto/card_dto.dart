import '../../dataBase/models/card_entity.dart';

class CardDto {

  String id;
  String cardSetId;
  String content;
  String? type;
  bool? isReported;
  int? reports;

  CardDto({
      required this.id,
      required this.cardSetId,
      required this.content,
      this.type,
      this.isReported,
      this.reports
  });

  factory CardDto.fromCardEntity(CardEntity cardEntity, String cardSetId) => CardDto(
    id: cardEntity.workshopId ?? '',
    content: cardEntity.content,
    cardSetId: cardSetId
  );

  factory CardDto.fromJson(Map<String, dynamic> json) => CardDto(
    id: json['id'] as String,
    cardSetId: json['cardSetId'] as String,
    content: json['content'] as String,
    type: json['type'] as String?,
    isReported: json['isReported'] as bool?,
    reports: json['reports'] as int?
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'cardSetId': cardSetId,
    'content': content,
    'type': type,
    'isReported': isReported,
    'reports': reports
  };

}