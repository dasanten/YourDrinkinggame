import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_drinking_game_app/data_base/db_namings.dart';

import 'model/card_entity.dart';
import 'model/card_set_entity.dart';

class CardSetDB {

  CardSetDB._();
  static final CardSetDB cardSetDB = CardSetDB._();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    return _database = await createDataBase();
  }

  Future<Database> createDataBase() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(
      join(dbPath, 'card_set_database.db'),
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
          """
          CREATE TABLE $TABLE_CARD_SET (
              $COLUMN_CARD_SET_ID INTEGER PRIMARY KEY,
              $COLUMN_CARD_SET_NAME TEXT,
              $COLUMN_CARD_SET_DESCRIPTION TEXT,
              $COLUMN_CARD_SET_ACTIVE INTEGER,
              $COLUMN_CARD_SET_WORKSHOP_ID TEXT,
              $COLUMN_CARD_SET_VERSION INTEGER)
          """,
        );
        await database.execute(
          """
            CREATE TABLE $TABLE_CARD (
              $COLUMN_CARD_ID INTEGER PRIMARY KEY,
              $COLUMN_CARD_CONTENT TEXT,
              $COLUMN_CARD_ACTIVE INTEGER,
              $COLUMN_CARD_WORKSHOP_ID TEXT,
              $COLUMN_CARD_CARD_SET_ID INTEGER,
              $COLUMN_CARD_CARD_ID INTEGER,
              FOREIGN KEY($COLUMN_CARD_CARD_ID) REFERENCES $TABLE_CARD($COLUMN_CARD_ID)
                ON DELETE CASCADE ON UPDATE CASCADE,
              FOREIGN KEY($COLUMN_CARD_CARD_SET_ID) REFERENCES $TABLE_CARD_SET($COLUMN_CARD_SET_ID)
                ON DELETE NO ACTION ON UPDATE NO ACTION)""",
        );

          await database.execute(
          """
            CREATE TABLE $TABLE_USER (
              $COLUMN_USER_ID INTEGER PRIMARY KEY,
              $COLUMN_USER_WORKSHOP_ID TEXT,
              $COLUMN_USER_NAME TEXT,
              $COLUMN_USER_NSFW INTEGER)
          """
        );

        await database.execute(
          """
            CREATE TABLE $TABLE_USER_ROLE (
              $COLUMN_USER_ROLE_USER_ID TEXT,
              $COLUMN_USER_ROLE_CARD_SET_ID TEXT,
              $COLUMN_USER_ROLE_ROLE TEXT,
              FOREIGN KEY($COLUMN_USER_ROLE_USER_ID) REFERENCES $TABLE_CARD_SET($COLUMN_CARD_SET_ID)
                ON DELETE CASCADE ON UPDATE CASCADE,
              FOREIGN KEY($COLUMN_USER_ROLE_CARD_SET_ID) REFERENCES $TABLE_USER($COLUMN_USER_ID)
                ON DELETE CASCADE ON UPDATE CASCADE
            )
    	    """
        );
        await database.insert(TABLE_CARD_SET, const CardSetEntity(workshopId: 'base-set' ,name: 'Standard Set', active: true, description: 'Standard Set', version: 0, nsfw: false).toMap());  
      },
    );
  }

  //CARD SET DB ACTIONS
  @deprecated
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

  @deprecated
  Future<CardSetEntity> insertCardSet(CardSetEntity cardSet) async {
    final db = await database;
    final id = await db.insert(TABLE_CARD_SET, cardSet.toMap());

    return cardSet.copyWith(
      id: id,
    );
  }

  @deprecated
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

  @deprecated
  Future<int> updateCardSet(CardSetEntity cardSet) async {
    final db = await database;

    return db.update(
      TABLE_CARD_SET,
      cardSet.toMap(),
      where: "$COLUMN_CARD_SET_ID =  ?",
      whereArgs: [cardSet.id],
    );
  }

  @deprecated
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

  //CARD DB ACTIONS
  @deprecated
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

  @deprecated
  Future<CardEntity> insertCard(CardEntity card) async {
    final db = await database;
    final id = await db.insert(TABLE_CARD, card.toMap());

    return card.copyWith(
      id: id,
    );
  }

  @deprecated
  Future<List<CardEntity>> insertCardList(
    List<CardEntity> cardEntityList,
  ) async {
    cardEntityList.forEach((card) async {
      card = await insertCard(card);
    });
    return cardEntityList;
  }

  @deprecated
  Future<int> deleteCard(int id) async {
    final db = await database;

    return db.delete(
      TABLE_CARD,
      where: "$COLUMN_CARD_ID = ?",
      whereArgs: [id],
    );
  }

  @deprecated
  Future<int> updateCard(CardEntity card) async {
    final db = await database;

    return db.update(
      TABLE_CARD,
      card.toMap(),
      where: "$COLUMN_CARD_ID = ?",
      whereArgs: [card.id],
    );
  }

  @deprecated
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
}
