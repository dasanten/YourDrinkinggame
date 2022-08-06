//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card_set_role.g.dart';

class CardSetRole extends EnumClass {

  @BuiltValueEnumConst(wireName: r'OWNER')
  static const CardSetRole OWNER = _$OWNER;
  @BuiltValueEnumConst(wireName: r'ADMIN')
  static const CardSetRole ADMIN = _$ADMIN;
  @BuiltValueEnumConst(wireName: r'MODERATOR')
  static const CardSetRole MODERATOR = _$MODERATOR;

  static Serializer<CardSetRole> get serializer => _$cardSetRoleSerializer;

  const CardSetRole._(String name): super(name);

  static BuiltSet<CardSetRole> get values => _$values;
  static CardSetRole valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CardSetRoleMixin = Object with _$CardSetRoleMixin;

