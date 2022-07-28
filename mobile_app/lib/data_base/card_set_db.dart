import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:your_drinking_game_app/data_base/db_namings.dart';

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
              $COLUMN_CARD_SET_VERSION INTEGER,
              $COLUMN_CARD_SET_CATEGORY TEXT)
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
              $COLUMN_CARD_TYPE TEXT,
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
      },
    );
  }

}
