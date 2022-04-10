//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CardSetBasicDto {
  /// Returns a new [CardSetBasicDto] instance.
  CardSetBasicDto({
    this.id,
    this.name,
    this.description,
    this.category,
    this.nsfw,
  });

  String id;

  String name;

  String description;

  String category;

  bool nsfw;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CardSetBasicDto &&
     other.id == id &&
     other.name == name &&
     other.description == description &&
     other.category == category &&
     other.nsfw == nsfw;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (category == null ? 0 : category.hashCode) +
    (nsfw == null ? 0 : nsfw.hashCode);

  @override
  String toString() => 'CardSetBasicDto[id=$id, name=$name, description=$description, category=$category, nsfw=$nsfw]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (name != null) {
      json[r'name'] = name;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (category != null) {
      json[r'category'] = category;
    }
    if (nsfw != null) {
      json[r'nsfw'] = nsfw;
    }
    return json;
  }

  /// Returns a new [CardSetBasicDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CardSetBasicDto fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return CardSetBasicDto(
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        category: mapValueOfType<String>(json, r'category'),
        nsfw: mapValueOfType<bool>(json, r'nsfw'),
      );
    }
    return null;
  }

  static List<CardSetBasicDto> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(CardSetBasicDto.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <CardSetBasicDto>[];

  static Map<String, CardSetBasicDto> mapFromJson(dynamic json) {
    final map = <String, CardSetBasicDto>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = CardSetBasicDto.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CardSetBasicDto-objects as value to a dart map
  static Map<String, List<CardSetBasicDto>> mapListFromJson(dynamic json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CardSetBasicDto>>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = CardSetBasicDto.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

