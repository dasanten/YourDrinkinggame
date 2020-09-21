import 'package:your_drinking_game_app/dataBase/CardSetDB.dart';

class CardSet {
  int id;
  String name;
  String description;
  String workshopId;
  bool active;


  CardSet(this.name, this.description, this.workshopId, this.active);

  Map<String, dynamic> toMap() {
    var map = {
      CardSetDB.COLUMN_CARD_SET_NAME  : name,
      CardSetDB.COLUMN_CARD_SET_DESCRIPTION : description,
      CardSetDB.COLUMN_CARD_SET_ACTIVE: active ? 1 : 0,
    };
    if(id != null) {
      map[CardSetDB.COLUMN_CARD_SET_ID] = id;
    }

    return map;
  }

  CardSet.fromMap(Map<String, dynamic> cardSetMap) {
    id = cardSetMap[CardSetDB.COLUMN_CARD_SET_ID];
    name = cardSetMap[CardSetDB.COLUMN_CARD_SET_NAME];
    description = cardSetMap[CardSetDB.COLUMN_CARD_SET_DESCRIPTION];
    workshopId = cardSetMap[CardSetDB.COLUMN_CARD_SET_WORKSHOP_ID];
    active = cardSetMap[CardSetDB.COLUMN_CARD_SET_ACTIVE] == 1;
  }

}