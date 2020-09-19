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
      CardSetDB.COLUMN_NAME  : name,
      CardSetDB.COLUMN_DESCRIPTION : description,
      CardSetDB.COLUMN_ACTIVE: active ? 1 : 0,
    };
    if(id != null) {
      map[CardSetDB.COLUMN_ID] = id;
    }

    return map;
  }

  CardSet.fromMap(Map<String, dynamic> cardSetMap) {
    id = cardSetMap[CardSetDB.COLUMN_ID];
    name = cardSetMap[CardSetDB.COLUMN_NAME];
    description = cardSetMap[CardSetDB.COLUMN_DESCRIPTION];
    workshopId = cardSetMap[CardSetDB.COLUMN_WORKSHOP_ID];
    active = cardSetMap[CardSetDB.COLUMN_ACTIVE] == 1;
  }

}