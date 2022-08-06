//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:drinkinggame_api/src/date_serializer.dart';
import 'package:drinkinggame_api/src/model/date.dart';

import 'package:drinkinggame_api/src/model/card_dto.dart';
import 'package:drinkinggame_api/src/model/card_set_basic_dto.dart';
import 'package:drinkinggame_api/src/model/card_set_dto.dart';
import 'package:drinkinggame_api/src/model/card_set_role.dart';
import 'package:drinkinggame_api/src/model/card_type.dart';
import 'package:drinkinggame_api/src/model/feedback_dto.dart';
import 'package:drinkinggame_api/src/model/user_basic_dto.dart';
import 'package:drinkinggame_api/src/model/user_dto.dart';
import 'package:drinkinggame_api/src/model/user_role.dart';
import 'package:drinkinggame_api/src/model/user_with_card_set_role.dart';

part 'serializers.g.dart';

@SerializersFor([
  CardDto,
  CardSetBasicDto,
  CardSetDto,
  CardSetRole,
  CardType,
  FeedbackDto,
  UserBasicDto,
  UserDto,
  UserRole,
  UserWithCardSetRole,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CardSetBasicDto)]),
        () => ListBuilder<CardSetBasicDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UserWithCardSetRole)]),
        () => ListBuilder<UserWithCardSetRole>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(FeedbackDto)]),
        () => ListBuilder<FeedbackDto>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UserDto)]),
        () => ListBuilder<UserDto>(),
      )
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
