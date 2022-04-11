// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UserRole _$SUPER_ADMIN = const UserRole._('SUPER_ADMIN');
const UserRole _$ADMIN = const UserRole._('ADMIN');
const UserRole _$MODERATOR = const UserRole._('MODERATOR');
const UserRole _$HELPER = const UserRole._('HELPER');
const UserRole _$USER = const UserRole._('USER');

UserRole _$valueOf(String name) {
  switch (name) {
    case 'SUPER_ADMIN':
      return _$SUPER_ADMIN;
    case 'ADMIN':
      return _$ADMIN;
    case 'MODERATOR':
      return _$MODERATOR;
    case 'HELPER':
      return _$HELPER;
    case 'USER':
      return _$USER;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<UserRole> _$values = new BuiltSet<UserRole>(const <UserRole>[
  _$SUPER_ADMIN,
  _$ADMIN,
  _$MODERATOR,
  _$HELPER,
  _$USER,
]);

class _$UserRoleMeta {
  const _$UserRoleMeta();
  UserRole get SUPER_ADMIN => _$SUPER_ADMIN;
  UserRole get ADMIN => _$ADMIN;
  UserRole get MODERATOR => _$MODERATOR;
  UserRole get HELPER => _$HELPER;
  UserRole get USER => _$USER;
  UserRole valueOf(String name) => _$valueOf(name);
  BuiltSet<UserRole> get values => _$values;
}

abstract class _$UserRoleMixin {
  // ignore: non_constant_identifier_names
  _$UserRoleMeta get UserRole => const _$UserRoleMeta();
}

Serializer<UserRole> _$userRoleSerializer = new _$UserRoleSerializer();

class _$UserRoleSerializer implements PrimitiveSerializer<UserRole> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'SUPER_ADMIN': 'SUPER_ADMIN',
    'ADMIN': 'ADMIN',
    'MODERATOR': 'MODERATOR',
    'HELPER': 'HELPER',
    'USER': 'USER',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'SUPER_ADMIN': 'SUPER_ADMIN',
    'ADMIN': 'ADMIN',
    'MODERATOR': 'MODERATOR',
    'HELPER': 'HELPER',
    'USER': 'USER',
  };

  @override
  final Iterable<Type> types = const <Type>[UserRole];
  @override
  final String wireName = 'UserRole';

  @override
  Object serialize(Serializers serializers, UserRole object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UserRole deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UserRole.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
