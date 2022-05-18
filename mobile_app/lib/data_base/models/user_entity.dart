import 'package:drinkinggame_api/drinkinggame_api.dart';
import 'package:flutter/foundation.dart';

@immutable
class UserEntity {
  final String userId;
  final String username;
  final String eMail;

  const UserEntity({
    required this.userId, 
    required this.username,
    required this.eMail,
  });

  factory UserEntity.fromDto(UserDto userDto) => UserEntity(
    userId: userDto.id!,
    username: userDto.username!,
    eMail: userDto.eMail!
  );


}