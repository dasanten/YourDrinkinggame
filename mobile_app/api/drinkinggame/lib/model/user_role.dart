//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UserRole {
  /// Instantiate a new enum with the provided [value].
  const UserRole._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value ?? '';

  String toJson() => value;

  static const SUPER_ADMIN = UserRole._(r'SUPER_ADMIN');
  static const ADMIN = UserRole._(r'ADMIN');
  static const MODERATOR = UserRole._(r'MODERATOR');
  static const HELPER = UserRole._(r'HELPER');
  static const USER = UserRole._(r'USER');

  /// List of all possible values in this [enum][UserRole].
  static const values = <UserRole>[
    SUPER_ADMIN,
    ADMIN,
    MODERATOR,
    HELPER,
    USER,
  ];

  static UserRole fromJson(dynamic value) =>
    UserRoleTypeTransformer().decode(value);

  static List<UserRole> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(UserRole.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <UserRole>[];
}

/// Transformation class that can [encode] an instance of [UserRole] to String,
/// and [decode] dynamic data back to [UserRole].
class UserRoleTypeTransformer {
  factory UserRoleTypeTransformer() => _instance ??= const UserRoleTypeTransformer._();

  const UserRoleTypeTransformer._();

  String encode(UserRole data) => data.value;

  /// Decodes a [dynamic value][data] to a UserRole.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserRole decode(dynamic data, {bool allowNull}) {
    if (data != null) {
      switch (data.toString()) {
        case r'SUPER_ADMIN': return UserRole.SUPER_ADMIN;
        case r'ADMIN': return UserRole.ADMIN;
        case r'MODERATOR': return UserRole.MODERATOR;
        case r'HELPER': return UserRole.HELPER;
        case r'USER': return UserRole.USER;
        default:
          if (allowNull == false) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [UserRoleTypeTransformer] instance.
  static UserRoleTypeTransformer _instance;
}

