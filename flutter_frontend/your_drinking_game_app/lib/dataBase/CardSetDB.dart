import 'dart:async';
import 'dart:ffi';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_drinking_game_app/models/CardSet.dart';

class CardSetDB {

  static const String TABLE_CARD_SET = "card_set";

  static const String COLUMN_ID = "id";
  static const String COLUMN_NAME = "name";
  static const String COLUMN_DESCRIPTION = "description";
  static const String COLUMN_ACTIVE = "active";
  static const String COLUMN_WORKSHOP_ID = "workshop_id";

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
          "CREATE TABLE $TABLE_CARD_SET ($COLUMN_ID INTEGER PRIMARY KEY, $COLUMN_NAME TEXT, $COLUMN_DESCRIPTION TEXT, $COLUMN_ACTIVE INTEGER, $COLUMN_WORKSHOP_ID TEXT)"
        );
      }
    );
  }

  Future<List<CardSet>> getCardSets() async {
    final db = await database;
    var cardSets = await db.query(
      TABLE_CARD_SET,
      columns: [COLUMN_ID, COLUMN_NAME, COLUMN_DESCRIPTION, COLUMN_ACTIVE, COLUMN_WORKSHOP_ID]
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

  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      TABLE_CARD_SET,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(CardSet cardSet) async{
    final db = await database;

    return await db.update(
        TABLE_CARD_SET,
        cardSet.toMap(),
        where: "id =  ?",
        whereArgs: [cardSet.id],
    );
  }

  Future<CardSet> getCardSetById(String id) async {

  }

}