//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CardType {
  /// Instantiate a new enum with the provided [value].
  const CardType._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value ?? '';

  String toJson() => value;

  static const STANDARD = CardType._(r'STANDARD');
  static const LATER = CardType._(r'LATER');
  static const NEXT = CardType._(r'NEXT');
  static const CLEAR = CardType._(r'CLEAR');
  static const GAME = CardType._(r'GAME');

  /// List of all possible values in this [enum][CardType].
  static const values = <CardType>[
    STANDARD,
    LATER,
    NEXT,
    CLEAR,
    GAME,
  ];

  static CardType fromJson(dynamic value) =>
    CardTypeTypeTransformer().decode(value);

  static List<CardType> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(CardType.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <CardType>[];
}

/// Transformation class that can [encode] an instance of [CardType] to String,
/// and [decode] dynamic data back to [CardType].
class CardTypeTypeTransformer {
  factory CardTypeTypeTransformer() => _instance ??= const CardTypeTypeTransformer._();

  const CardTypeTypeTransformer._();

  String encode(CardType data) => data.value;

  /// Decodes a [dynamic value][data] to a CardType.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CardType decode(dynamic data, {bool allowNull}) {
    if (data != null) {
      switch (data.toString()) {
        case r'STANDARD': return CardType.STANDARD;
        case r'LATER': return CardType.LATER;
        case r'NEXT': return CardType.NEXT;
        case r'CLEAR': return CardType.CLEAR;
        case r'GAME': return CardType.GAME;
        default:
          if (allowNull == false) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CardTypeTypeTransformer] instance.
  static CardTypeTypeTransformer _instance;
}

