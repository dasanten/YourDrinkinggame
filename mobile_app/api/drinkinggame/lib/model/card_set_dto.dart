//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CardSetDto {
  /// Returns a new [CardSetDto] instance.
  CardSetDto({
    this.id,
    this.name,
    this.description,
    this.category,
    this.version,
    this.nsfw,
    this.creator,
    this.cards = const [],
  });

  String id;

  String name;

  String description;

  String category;

  num version;

  bool nsfw;

  UserBasicDto creator;

  List<CardDto> cards;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CardSetDto &&
     other.id == id &&
     other.name == name &&
     other.description == description &&
     other.category == category &&
     other.version == version &&
     other.nsfw == nsfw &&
     other.creator == creator &&
     other.cards == cards;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (id == null ? 0 : id.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (category == null ? 0 : category.hashCode) +
    (version == null ? 0 : version.hashCode) +
    (nsfw == null ? 0 : nsfw.hashCode) +
    (creator == null ? 0 : creator.hashCode) +
    (cards == null ? 0 : cards.hashCode);

  @override
  String toString() => 'CardSetDto[id=$id, name=$name, description=$description, category=$category, version=$version, nsfw=$nsfw, creator=$creator, cards=$cards]';

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
    if (version != null) {
      json[r'version'] = version;
    }
    if (nsfw != null) {
      json[r'nsfw'] = nsfw;
    }
    if (creator != null) {
      json[r'creator'] = creator;
    }
    if (cards != null) {
      json[r'cards'] = cards;
    }
    return json;
  }

  /// Returns a new [CardSetDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CardSetDto fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return CardSetDto(
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        category: mapValueOfType<String>(json, r'category'),
        version: json[r'version'] == null
          ? null
          : num.parse(json[r'version'].toString()),
        nsfw: mapValueOfType<bool>(json, r'nsfw'),
        creator: UserBasicDto.fromJson(json[r'creator']),
        cards: CardDto.listFromJson(json[r'cards']),
      );
    }
    return null;
  }

  static List<CardSetDto> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(CardSetDto.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <CardSetDto>[];

  static Map<String, CardSetDto> mapFromJson(dynamic json) {
    final map = <String, CardSetDto>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = CardSetDto.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CardSetDto-objects as value to a dart map
  static Map<String, List<CardSetDto>> mapListFromJson(dynamic json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CardSetDto>>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = CardSetDto.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

