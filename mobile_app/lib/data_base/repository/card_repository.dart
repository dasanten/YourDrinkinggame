import 'package:sqflite/sqflite.dart';
import 'package:your_drinking_game_app/data_base/card_set_db.dart';
import 'package:your_drinking_game_app/data_base/db_namings.dart';
import 'package:your_drinking_game_app/data_base/model/card_entity.dart';

Future<Database> get database => CardSetDB.cardSetDB.database;


//CARD DB ACTIONS
Future<List<CardEntity>> getCards(int cardSetId) async {
  final db = await database;

  final cards = await db.query(
    TABLE_CARD,
    columns: allCardColumns,
    where: "$COLUMN_CARD_CARD_SET_ID = ?",
    whereArgs: [cardSetId],
  );

  return cards.map<CardEntity>((e) => CardEntity.fromMap(e)).toList();
}

Future<CardEntity> insertCard(CardEntity card) async {
  final db = await database;
  final id = await db.insert(TABLE_CARD, card.toMap());

  return card.copyWith(
    id: id,
  );
}

Future<List<CardEntity>> insertCardList(List<CardEntity> cardEntityList) async {
  cardEntityList.forEach((card) async {
    card = await insertCard(card);
  });
  return cardEntityList;
}

Future<int> deleteCard(int id) async {
  final db = await database;

  return db.delete(
    TABLE_CARD,
    where: "$COLUMN_CARD_ID = ?",
    whereArgs: [id],
  );
}

Future<int> updateCard(CardEntity card) async {
  final db = await database;

  return db.update(
    TABLE_CARD,
    card.toMap(),
    where: "$COLUMN_CARD_ID = ?",
    whereArgs: [card.id],
  );
}

Future<List<CardEntity>> getActiveCards() async {
  final db = await database;

  final newCards = await db.rawQuery(
    "SELECT C.$COLUMN_CARD_ID, "
    "       C.$COLUMN_CARD_CONTENT, "
    "       C.$COLUMN_CARD_ACTIVE, "
    "       C.$COLUMN_CARD_WORKSHOP_ID, "
    "       C.$COLUMN_CARD_CARD_SET_ID "
    "FROM $TABLE_CARD_SET CS "
    " JOIN $TABLE_CARD C "
    "   ON C.$COLUMN_CARD_CARD_SET_ID = CS.$COLUMN_CARD_SET_ID "
    "WHERE CS.$COLUMN_CARD_SET_ACTIVE = 1 AND C.$COLUMN_CARD_ACTIVE = 1",
  );
  if (newCards.isNotEmpty) {
    return newCards.map((e) => CardEntity.fromMap(e)).toList();
  }

  return <CardEntity>[];
}