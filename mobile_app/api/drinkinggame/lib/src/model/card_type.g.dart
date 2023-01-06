// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CardType _$STANDARD = const CardType._('STANDARD');
const CardType _$LATER = const CardType._('LATER');
const CardType _$NEXT = const CardType._('NEXT');
const CardType _$CLEAR = const CardType._('CLEAR');
const CardType _$GAME = const CardType._('GAME');

CardType _$valueOf(String name) {
  switch (name) {
    case 'STANDARD':
      return _$STANDARD;
    case 'LATER':
      return _$LATER;
    case 'NEXT':
      return _$NEXT;
    case 'CLEAR':
      return _$CLEAR;
    case 'GAME':
      return _$GAME;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CardType> _$values = new BuiltSet<CardType>(const <CardType>[
  _$STANDARD,
  _$LATER,
  _$NEXT,
  _$CLEAR,
  _$GAME,
]);

class _$CardTypeMeta {
  const _$CardTypeMeta();
  CardType get STANDARD => _$STANDARD;
  CardType get LATER => _$LATER;
  CardType get NEXT => _$NEXT;
  CardType get CLEAR => _$CLEAR;
  CardType get GAME => _$GAME;
  CardType valueOf(String name) => _$valueOf(name);
  BuiltSet<CardType> get values => _$values;
}

abstract class _$CardTypeMixin {
  // ignore: non_constant_identifier_names
  _$CardTypeMeta get CardType => const _$CardTypeMeta();
}

Serializer<CardType> _$cardTypeSerializer = new _$CardTypeSerializer();

class _$CardTypeSerializer implements PrimitiveSerializer<CardType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'STANDARD': 'STANDARD',
    'LATER': 'LATER',
    'NEXT': 'NEXT',
    'CLEAR': 'CLEAR',
    'GAME': 'GAME',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'STANDARD': 'STANDARD',
    'LATER': 'LATER',
    'NEXT': 'NEXT',
    'CLEAR': 'CLEAR',
    'GAME': 'GAME',
  };

  @override
  final Iterable<Type> types = const <Type>[CardType];
  @override
  final String wireName = 'CardType';

  @override
  Object serialize(Serializers serializers, CardType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CardType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CardType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
