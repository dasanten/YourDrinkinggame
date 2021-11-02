import '../../models/CardSetEntity.dart';


class CardSetVersionDto {
  
  String id;
  int version;

  CardSetVersionDto({required this.id, required this.version});

  Map<String, dynamic> toJson() => {
    'id': id,
    'version': version,
  };

    factory CardSetVersionDto.fromCardEntity(CardSetEntity cardSetEntity) => CardSetVersionDto(
    id: cardSetEntity.workshopId!,
    version: cardSetEntity.version!,
  );
}