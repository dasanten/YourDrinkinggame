import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_drinking_game_app/models/CardEntity.dart';
import 'package:your_drinking_game_app/models/CardSet.dart';

class CardSetDB {

  static const String TABLE_CARD_SET = "card_set";

  static const String COLUMN_CARD_SET_ID = "id";
  static const String COLUMN_CARD_SET_NAME = "name";
  static const String COLUMN_CARD_SET_DESCRIPTION = "description";
  static const String COLUMN_CARD_SET_ACTIVE = "active";
  static const String COLUMN_CARD_SET_WORKSHOP_ID = "workshop_id";

  static const String TABLE_CARD = "card";

  static const String COLUMN_CARD_ID = "id";
  static const String COLUMN_CARD_CONTENT = "content";
  static const String COLUMN_CARD_ACTIVE = "active";
  static const String COLUMN_CARD_WORKSHOP_ID = "workshop_id";
  static const String COLUMN_CARD_CARD_SET_ID = "card_set_id";


  CardSetDB._();
  static final CardSetDB cardSetDB = CardSetDB._();
  Database _database;

  Future<Database> get database async {
    if(_database != null) {
      return _database;
    }

    _database = await createDataBase();

    return _database;
  }



  Future<Database> createDataBase() async{
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'card_set_database.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute(
          "CREATE TABLE $TABLE_CARD_SET ("
              "$COLUMN_CARD_SET_ID INTEGER PRIMARY KEY, "
              "$COLUMN_CARD_SET_NAME TEXT, "
              "$COLUMN_CARD_SET_DESCRIPTION TEXT, "
              "$COLUMN_CARD_SET_ACTIVE INTEGER, "
              "$COLUMN_CARD_SET_WORKSHOP_ID TEXT "
        );
        await database.execute(
            "CREATE TABLE $TABLE_CARD ("
              "$COLUMN_CARD_ID INTEGER PRIMARY KEY, "
              "$COLUMN_CARD_CONTENT TEXT, "
              "$COLUMN_CARD_ACTIVE INTEGER, "
              "$COLUMN_CARD_WORKSHOP_ID TEXT"
              "FOREIGN KEY ($COLUMN_CARD_CARD_SET_ID) REFERENCES $TABLE_CARD_SET ($COLUMN_CARD_SET_ID)"
                "ON DELETE NO ACTION ON UPDATE NO ACTION)");
      }
    );
  }

  //CARD SET DB ACTIONS

  Future<List<CardSet>> getCardSets() async {
    final db = await database;
    var cardSets = await db.query(
      TABLE_CARD_SET,
      columns: [COLUMN_CARD_SET_ID, COLUMN_CARD_SET_NAME, COLUMN_CARD_SET_DESCRIPTION, COLUMN_CARD_SET_ACTIVE, COLUMN_CARD_SET_WORKSHOP_ID]
    );

    List<CardSet> cardSetList = new List<CardSet>();

    cardSets.forEach((currentCardSet) {
      CardSet cardSet = CardSet.fromMap(currentCardSet);
      cardSetList.add(cardSet);
    });
    return cardSetList;
  }

  Future<CardSet> insertCardSet(CardSet cardSet) async {
    final db = await database;
    cardSet.id = await db.insert(TABLE_CARD_SET, cardSet.toMap());
    return cardSet;
  }

  Future<int> deleteCardSet(int id) async {
    final db = await database;

    return await db.delete(
      TABLE_CARD_SET,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateCardSet(CardSet cardSet) async{
    final db = await database;

    return await db.update(
        TABLE_CARD_SET,
        cardSet.toMap(),
        where: "id =  ?",
        whereArgs: [cardSet.id],
    );
  }

  //CARD DB ACTIONS
  Future<List<CardEntity>> getCards() async {
    final db = await database;

    var cards = await db.query(
      TABLE_CARD,
      columns: [COLUMN_CARD_ID, COLUMN_CARD_CONTENT, COLUMN_CARD_ACTIVE, COLUMN_CARD_WORKSHOP_ID, COLUMN_CARD_CARD_SET_ID]
    );

    List<CardEntity> cardList = new List<CardEntity>();

    cards.forEach((currentCard) {
      CardEntity card = new CardEntity.fromMap(currentCard);
      cardList.add(card);
    });
    return cardList;
  }

  Future<CardEntity> insertCard(CardEntity card) async {
    final db = await database;

    card.id = await db.insert(TABLE_CARD, card.toMap());
    return card;
  }

  Future<int> deleteCard(int id) async {
    final db = await database;

    return await db.delete(
      TABLE_CARD,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateCard(CardEntity card) async {
    final db = await database;

    return await db.update(
        TABLE_CARD,
        card.toMap(),
      where: "id = ?",
      whereArgs: [card.id]
    );
  }

}