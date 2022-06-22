import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/foundation.dart';
import 'package:your_drinking_game_app/data_base/db_namings.dart';

@immutable
class UserEntity {
  final int? id;
  final String username;
  final String workshopId;
  final bool? nsfw;

  const UserEntity({
    this.id, 
    required this.workshopId,
    required this.username,
    this.nsfw,
  });

  factory UserEntity.fromDto(UserDto userDto) => UserEntity(
    id: null,
    workshopId: userDto.id!,
    username: userDto.username!,
    nsfw: false
  );

  Map<String, dynamic> toMap() => {
    if (id != null) COLUMN_USER_ID: id,
    COLUMN_USER_NAME: username,
    COLUMN_USER_WORKSHOP_ID: id,
    COLUMN_USER_NSFW: nsfw ?? false ? 1 : 0,
  };

  factory UserEntity.fromMap(Map<String, dynamic> map) => UserEntity(
    id: map[COLUMN_USER_ID] as int,
    username: map[COLUMN_USER_NAME] as String,
    workshopId: map[COLUMN_USER_WORKSHOP_ID] as String,
    nsfw: map[COLUMN_USER_NSFW] as int == 1,
  );

  copyWith({String? username, bool? nsfw, String? workshopId, int? id}) =>
    UserEntity(
      id: id ?? this.id,
      workshopId: workshopId ?? this.workshopId,
      username: username ?? this.username,
      nsfw: nsfw ?? this.nsfw,
    );
}