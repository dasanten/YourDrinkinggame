import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_drinking_game_app/data_base/card_set_db.dart';
import 'package:your_drinking_game_app/data_base/db_namings.dart';
import 'package:your_drinking_game_app/data_base/model/card_set_entity.dart';
import 'package:your_drinking_game_app/data_base/model/user_entity.dart';

import '../../services/user_service.dart';

Future<Database> get database => CardSetDB.cardSetDB.database;

Future<List<CardSetEntity>> getCardSets() async {
  final db = await database;
  final cardSets = await db.query(
    TABLE_CARD_SET,
    columns: allCardSetColumns,
  );

  return cardSets
      .map<CardSetEntity>((e) => CardSetEntity.fromMap(e))
      .toList();
}

// Get Cardset by UserId from UserRole table
Future<List<CardSetEntity>> getCardSetsByUserId(int userId) async {
  final db = await database;
  final cardSets = await db.rawQuery("""
    SELECT * FROM $TABLE_CARD_SET
    JOIN $TABLE_USER_ROLE 
    ON $TABLE_CARD_SET.$COLUMN_CARD_SET_ID = $TABLE_USER_ROLE.$COLUMN_USER_ROLE_CARD_SET_ID
    WHERE $TABLE_USER_ROLE.$COLUMN_USER_ROLE_USER_ID = $userId""");

  return cardSets
      .map<CardSetEntity>((e) => CardSetEntity.fromMap(e))
      .toList();
}


Future<CardSetEntity> insertCardSet(CardSetEntity cardSet, int userId, {CardSetRole? role}) async {
  final db = await database;
  final id = await db.insert(TABLE_CARD_SET, cardSet.toMap());

  await db.insert(TABLE_USER_ROLE, {
    COLUMN_USER_ROLE_USER_ID: userId,
    COLUMN_USER_ROLE_CARD_SET_ID: id,
    if(role!=null) COLUMN_USER_ROLE_ROLE: role,
  });

  return cardSet.copyWith(
    id: id,
  );
}

Future<int> deleteCardSet(int id) async {
  final db = await database;

  await db.delete(
    TABLE_USER_ROLE, 
    where: "$COLUMN_USER_ROLE_CARD_SET_ID = ? AND $COLUMN_USER_ROLE_USER_ID = ?", 
    whereArgs: [id, currentUserId]
  );

  await db.delete(
    TABLE_CARD,
    where: "$COLUMN_CARD_CARD_SET_ID = ?",
    whereArgs: [id],
  );

  return db.delete(
    TABLE_CARD_SET,
    where: "$COLUMN_CARD_SET_ID = ?",
    whereArgs: [id],
  );
}

Future<int> updateCardSet(CardSetEntity cardSet) async {
  final db = await database;

  return db.update(
    TABLE_CARD_SET,
    cardSet.toMap(),
    where: "$COLUMN_CARD_SET_ID =  ?",
    whereArgs: [cardSet.id],
  );
}

Future<bool> containsCardSet(String id) async {
  final db = await database;

  final result = await db.query(
    TABLE_CARD_SET,
    columns: [COLUMN_CARD_SET_WORKSHOP_ID],
    distinct: true,
    where: "$COLUMN_CARD_SET_WORKSHOP_ID = ?",
    whereArgs: [id],
  );

  return result.isNotEmpty;
}

Future<CardSetRole?> getUserRole(int cardSetId, int userId) async {
  final db = await database;

  final result = await db.rawQuery("""
    SELECT $COLUMN_USER_ROLE_ROLE FROM $TABLE_USER_ROLE
    WHERE $COLUMN_USER_ROLE_CARD_SET_ID = $cardSetId
    AND $COLUMN_USER_ROLE_USER_ID = $userId
  """);

  if(result.isEmpty || result.first[COLUMN_USER_ROLE_ROLE] == null) {
    return null;
  }
  return CardSetRole.valueOf(result.first[COLUMN_USER_ROLE_ROLE] as String);
}