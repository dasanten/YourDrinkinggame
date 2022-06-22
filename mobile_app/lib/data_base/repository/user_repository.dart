import 'package:sqflite/sqflite.dart';

import '../card_set_db.dart';
import '../db_namings.dart';
import '../model/user_entity.dart';

Future<Database> get database => CardSetDB.cardSetDB.database;

Future<UserEntity> getUser(String id) async {
  final db = await database;

  final user = await db.query(
    TABLE_USER,
    columns: allUserColumns,
    where: "$COLUMN_USER_ID = ?",
    whereArgs: [id],
  );

  if(user.isEmpty) {
    throw Exception("User with id $id not found");
  }

  return user.map<UserEntity>((e) => UserEntity.fromMap(e)).toList().first;
}

Future<UserEntity> insertUser(UserEntity user) async {
  final db = await database;
  final id = await db.insert(TABLE_USER, user.toMap());

  return user.copyWith(id: id);
}

Future<UserEntity> updateUser(UserEntity user) async {
  final db = await database;

  final id = await db.update(
    TABLE_USER,
    user.toMap(),
    where: "$COLUMN_USER_ID = ?",
    whereArgs: [user.id],
  );

  return user.copyWith(id: id);
  
}