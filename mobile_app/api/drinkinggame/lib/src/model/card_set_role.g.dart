// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_set_role.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CardSetRole _$OWNER = const CardSetRole._('OWNER');
const CardSetRole _$ADMIN = const CardSetRole._('ADMIN');
const CardSetRole _$MODERATOR = const CardSetRole._('MODERATOR');

CardSetRole _$valueOf(String name) {
  switch (name) {
    case 'OWNER':
      return _$OWNER;
    case 'ADMIN':
      return _$ADMIN;
    case 'MODERATOR':
      return _$MODERATOR;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CardSetRole> _$values =
    new BuiltSet<CardSetRole>(const <CardSetRole>[
  _$OWNER,
  _$ADMIN,
  _$MODERATOR,
]);

class _$CardSetRoleMeta {
  const _$CardSetRoleMeta();
  CardSetRole get OWNER => _$OWNER;
  CardSetRole get ADMIN => _$ADMIN;
  CardSetRole get MODERATOR => _$MODERATOR;
  CardSetRole valueOf(String name) => _$valueOf(name);
  BuiltSet<CardSetRole> get values => _$values;
}

abstract class _$CardSetRoleMixin {
  // ignore: non_constant_identifier_names
  _$CardSetRoleMeta get CardSetRole => const _$CardSetRoleMeta();
}

Serializer<CardSetRole> _$cardSetRoleSerializer = new _$CardSetRoleSerializer();

class _$CardSetRoleSerializer implements PrimitiveSerializer<CardSetRole> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'OWNER': 'OWNER',
    'ADMIN': 'ADMIN',
    'MODERATOR': 'MODERATOR',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'OWNER': 'OWNER',
    'ADMIN': 'ADMIN',
    'MODERATOR': 'MODERATOR',
  };

  @override
  final Iterable<Type> types = const <Type>[CardSetRole];
  @override
  final String wireName = 'CardSetRole';

  @override
  Object serialize(Serializers serializers, CardSetRole object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CardSetRole deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CardSetRole.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
