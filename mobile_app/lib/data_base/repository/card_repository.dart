import 'package:sqflite/sqflite.dart';
import 'package:your_drinking_game_app/data_base/card_set_db.dart';
import 'package:your_drinking_game_app/data_base/db_namings.dart';
import 'package:your_drinking_game_app/data_base/model/card_entity.dart';
import 'package:your_drinking_game_app/extension/card_extension.dart';

import '../../services/user_service.dart';

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

Future<CardEntity?> getRelatedCardById(int cardId) async {
  final db = await CardSetDB.cardSetDB.database;

  var card = await db.rawQuery("""
    SELECT * FROM $TABLE_CARD C1, $TABLE_CARD C2
    WHERE C1.$COLUMN_CARD_ID = $cardId AND C2.$COLUMN_CARD_ID = C1.$COLUMN_CARD_CARD_ID""");

  if (card.isEmpty) {
    return null;
  }
  return CardEntity.fromMap(card.first);
}

Future<List<CardEntity>> getCardsWithRelatives(int cardSetId) async {
  final db = await CardSetDB.cardSetDB.database;

  final cards = await db.query(
    TABLE_CARD,
    columns: allCardColumns,
    where: "$COLUMN_CARD_CARD_SET_ID = ?",
    whereArgs: [cardSetId],
  );

  final List<int?> relativeIds =
      cards.map((e) => e[COLUMN_CARD_CARD_ID] as int?).toList();

  relativeIds.removeWhere((element) => element == null);

  final relativeCards = await db.rawQuery("""
    SELECT * FROM $TABLE_CARD
    WHERE $COLUMN_CARD_ID IN (?)
  """, relativeIds.length > 1 ? [relativeIds] : relativeIds);

  final mappedCard =
      cards.map<CardEntity>((e) => CardEntity.fromMap(e)).toList();
  final mappedRelativeCards =
      relativeCards.map<CardEntity>((e) => CardEntity.fromMap(e)).toList();

  return mappedCard.map((card) {
    try {
      final relativeId = cards.firstWhere(
          (element) => element[COLUMN_CARD_ID] == card.id)[COLUMN_CARD_CARD_ID];
      final relativeCard = mappedRelativeCards
          .firstWhere((relative) => relative.id == relativeId);
      return card.copyWith(card: relativeCard);
    } catch (e) {
      return card;
    }
  }).toList();
}

Future<void> removeCards(List<int> ids) async {
  final db = await database;
  await db.rawDelete("""
      DELETE FROM $TABLE_CARD WHERE 
      $COLUMN_CARD_ID IN (?)
  """, ids);
}

Future<int> deleteCardsByCardSetId(int id) async {
  final db = await database;

  return await db.delete(
    TABLE_CARD,
    where: "$COLUMN_CARD_CARD_SET_ID = ?",
    whereArgs: [id],
  );
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
    var savedCard;
    if (card.card != null) {
      savedCard = await insertCard(card.card!);
    }
    card = await insertCard(card.copyWith(
      card: savedCard,
    ));
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

  if (!(card.type?.hasMultipleCards ?? false)) {
    removeRelatedCard(card.id!);
  }

  return db.update(
    TABLE_CARD,
    card.toMap(),
    where: "$COLUMN_CARD_ID = ?",
    whereArgs: [card.id],
  );
}

Future removeRelatedCard(int cardId) async {
  final db = await database;
  await db.rawDelete("""
    DELETE FROM $TABLE_CARD
    WHERE $COLUMN_CARD_ID = (
      SELECT $COLUMN_CARD_CARD_ID FROM $TABLE_CARD WHERE $COLUMN_CARD_CARD_ID = $cardId
    )""");
}

Future<List<CardEntity>> getActiveCards() async {
  final db = await database;

  final newCards = await db.rawQuery(
    """
    SELECT C.$COLUMN_CARD_ID, 
           C.$COLUMN_CARD_CONTENT, 
           C.$COLUMN_CARD_ACTIVE, 
           C.$COLUMN_CARD_WORKSHOP_ID, 
           C.$COLUMN_CARD_CARD_SET_ID,
           C.$COLUMN_CARD_TYPE,
           UR.$COLUMN_USER_ROLE_USER_ID
    FROM $TABLE_CARD C 
      JOIN $TABLE_CARD_SET CS
        ON C.$COLUMN_CARD_CARD_SET_ID = CS.$COLUMN_CARD_SET_ID 
      JOIN $TABLE_USER_ROLE UR
        ON CS.$COLUMN_CARD_SET_ID = UR.$COLUMN_USER_ROLE_CARD_SET_ID
    WHERE 
      UR.$COLUMN_USER_ROLE_USER_ID = $currentUserId AND         
      CS.$COLUMN_CARD_SET_ACTIVE = 1 AND 
      C.$COLUMN_CARD_ACTIVE = 1
  """,
  );
  if (newCards.isNotEmpty) {
    return newCards.map((e) => CardEntity.fromMap(e)).toList();
  }

  return <CardEntity>[];
}
