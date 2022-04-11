//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'card_type.g.dart';

class CardType extends EnumClass {

  @BuiltValueEnumConst(wireName: r'STANDARD')
  static const CardType STANDARD = _$STANDARD;
  @BuiltValueEnumConst(wireName: r'LATER')
  static const CardType LATER = _$LATER;
  @BuiltValueEnumConst(wireName: r'NEXT')
  static const CardType NEXT = _$NEXT;
  @BuiltValueEnumConst(wireName: r'CLEAR')
  static const CardType CLEAR = _$CLEAR;
  @BuiltValueEnumConst(wireName: r'GAME')
  static const CardType GAME = _$GAME;

  static Serializer<CardType> get serializer => _$cardTypeSerializer;

  const CardType._(String name): super(name);

  static BuiltSet<CardType> get values => _$values;
  static CardType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class CardTypeMixin = Object with _$CardTypeMixin;

