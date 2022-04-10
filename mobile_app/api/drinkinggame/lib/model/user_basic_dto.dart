//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserBasicDto {
  /// Returns a new [UserBasicDto] instance.
  UserBasicDto({
    this.id,
    this.username,
  });

  String id;

  String username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserBasicDto &&
     other.id == id &&
     other.username == username;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (id == null ? 0 : id.hashCode) +
    (username == null ? 0 : username.hashCode);

  @override
  String toString() => 'UserBasicDto[id=$id, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (username != null) {
      json[r'username'] = username;
    }
    return json;
  }

  /// Returns a new [UserBasicDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserBasicDto fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return UserBasicDto(
        id: mapValueOfType<String>(json, r'id'),
        username: mapValueOfType<String>(json, r'username'),
      );
    }
    return null;
  }

  static List<UserBasicDto> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(UserBasicDto.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <UserBasicDto>[];

  static Map<String, UserBasicDto> mapFromJson(dynamic json) {
    final map = <String, UserBasicDto>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = UserBasicDto.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of UserBasicDto-objects as value to a dart map
  static Map<String, List<UserBasicDto>> mapListFromJson(dynamic json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<UserBasicDto>>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = UserBasicDto.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

