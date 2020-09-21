import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';

class CardEntity {
  int id;
  String content;
  bool active;
  String workshopId;
  int cardSetId;

  CardEntity(this.id, this.content, this.active, this.workshopId, this.cardSetId);

  Map<String, dynamic> toMap() {
    var map = {
      CardSetDB.COLUMN_CARD_CONTENT: content,
      CardSetDB.COLUMN_CARD_ACTIVE: active ? 1 : 0,
      CardSetDB.COLUMN_CARD_WORKSHOP_ID: workshopId,
      CardSetDB.COLUMN_CARD_CARD_SET_ID: cardSetId,
    };

    if(id != null) {
      map[CardSetDB.COLUMN_CARD_ID] = id;
    }
    return map;
  }

  CardEntity.fromMap(Map<String, dynamic> map) {
    id = map[CardSetDB.COLUMN_CARD_ID];
    content = map[CardSetDB.COLUMN_CARD_CONTENT];
    active = map[CardSetDB.COLUMN_CARD_ACTIVE] == 1;
    workshopId = map[CardSetDB.COLUMN_CARD_WORKSHOP_ID];
    cardSetId = map[CardSetDB.COLUMN_CARD_CARD_SET_ID];
  }
}