//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CardDto {
  /// Returns a new [CardDto] instance.
  CardDto({
    this.id,
    this.content,
    this.card,
    this.type,
  });

  String id;

  String content;

  CardDto card;

  CardType type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CardDto &&
     other.id == id &&
     other.content == content &&
     other.card == card &&
     other.type == type;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (id == null ? 0 : id.hashCode) +
    (content == null ? 0 : content.hashCode) +
    (card == null ? 0 : card.hashCode) +
    (type == null ? 0 : type.hashCode);

  @override
  String toString() => 'CardDto[id=$id, content=$content, card=$card, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (content != null) {
      json[r'content'] = content;
    }
    if (card != null) {
      json[r'card'] = card;
    }
    if (type != null) {
      json[r'type'] = type;
    }
    return json;
  }

  /// Returns a new [CardDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CardDto fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return CardDto(
        id: mapValueOfType<String>(json, r'id'),
        content: mapValueOfType<String>(json, r'content'),
        card: CardDto.fromJson(json[r'card']),
        type: CardType.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<CardDto> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(CardDto.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <CardDto>[];

  static Map<String, CardDto> mapFromJson(dynamic json) {
    final map = <String, CardDto>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = CardDto.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of CardDto-objects as value to a dart map
  static Map<String, List<CardDto>> mapListFromJson(dynamic json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<CardDto>>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = CardDto.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

