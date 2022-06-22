import 'package:sqflite/sqflite.dart';
import 'package:your_drinking_game_app/data_base/card_set_db.dart';
import 'package:your_drinking_game_app/data_base/db_namings.dart';
import 'package:your_drinking_game_app/data_base/model/card_set_entity.dart';
import 'package:your_drinking_game_app/services/user_service.dart';

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


Future<CardSetEntity> insertCardSet(CardSetEntity cardSet, int userId) async {
  final db = await database;
  final id = await db.insert(TABLE_CARD_SET, cardSet.toMap());

  await db.insert(TABLE_USER_ROLE, {
    COLUMN_USER_ROLE_USER_ID: userId,
    COLUMN_USER_ROLE_CARD_SET_ID: id,
  });

  return cardSet.copyWith(
    id: id,
  );
}

Future<int> deleteCardSet(int id) async {
  final db = await database;

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