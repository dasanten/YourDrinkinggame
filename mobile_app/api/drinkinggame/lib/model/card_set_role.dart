//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CardSetRole {
  /// Instantiate a new enum with the provided [value].
  const CardSetRole._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value ?? '';

  String toJson() => value;

  static const OWNER = CardSetRole._(r'OWNER');
  static const ADMIN = CardSetRole._(r'ADMIN');
  static const MODERATOR = CardSetRole._(r'MODERATOR');

  /// List of all possible values in this [enum][CardSetRole].
  static const values = <CardSetRole>[
    OWNER,
    ADMIN,
    MODERATOR,
  ];

  static CardSetRole fromJson(dynamic value) =>
    CardSetRoleTypeTransformer().decode(value);

  static List<CardSetRole> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(CardSetRole.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <CardSetRole>[];
}

/// Transformation class that can [encode] an instance of [CardSetRole] to String,
/// and [decode] dynamic data back to [CardSetRole].
class CardSetRoleTypeTransformer {
  factory CardSetRoleTypeTransformer() => _instance ??= const CardSetRoleTypeTransformer._();

  const CardSetRoleTypeTransformer._();

  String encode(CardSetRole data) => data.value;

  /// Decodes a [dynamic value][data] to a CardSetRole.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CardSetRole decode(dynamic data, {bool allowNull}) {
    if (data != null) {
      switch (data.toString()) {
        case r'OWNER': return CardSetRole.OWNER;
        case r'ADMIN': return CardSetRole.ADMIN;
        case r'MODERATOR': return CardSetRole.MODERATOR;
        default:
          if (allowNull == false) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [CardSetRoleTypeTransformer] instance.
  static CardSetRoleTypeTransformer _instance;
}

