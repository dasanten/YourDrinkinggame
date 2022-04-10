//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserWithCardSetRole {
  /// Returns a new [UserWithCardSetRole] instance.
  UserWithCardSetRole({
    this.id,
    this.username,
    this.role,
  });

  String id;

  String username;

  CardSetRole role;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserWithCardSetRole &&
     other.id == id &&
     other.username == username &&
     other.role == role;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (id == null ? 0 : id.hashCode) +
    (username == null ? 0 : username.hashCode) +
    (role == null ? 0 : role.hashCode);

  @override
  String toString() => 'UserWithCardSetRole[id=$id, username=$username, role=$role]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (username != null) {
      json[r'username'] = username;
    }
    if (role != null) {
      json[r'role'] = role;
    }
    return json;
  }

  /// Returns a new [UserWithCardSetRole] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserWithCardSetRole fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return UserWithCardSetRole(
        id: mapValueOfType<String>(json, r'id'),
        username: mapValueOfType<String>(json, r'username'),
        role: CardSetRole.fromJson(json[r'role']),
      );
    }
    return null;
  }

  static List<UserWithCardSetRole> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(UserWithCardSetRole.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <UserWithCardSetRole>[];

  static Map<String, UserWithCardSetRole> mapFromJson(dynamic json) {
    final map = <String, UserWithCardSetRole>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = UserWithCardSetRole.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UserWithCardSetRole-objects as value to a dart map
  static Map<String, List<UserWithCardSetRole>> mapListFromJson(dynamic json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<UserWithCardSetRole>>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = UserWithCardSetRole.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

