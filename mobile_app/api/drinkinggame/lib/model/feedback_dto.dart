//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeedbackDto {
  /// Returns a new [FeedbackDto] instance.
  FeedbackDto({
    this.id,
    this.header,
    this.description,
    this.answerAddress,
  });

  String id;

  String header;

  String description;

  String answerAddress;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeedbackDto &&
     other.id == id &&
     other.header == header &&
     other.description == description &&
     other.answerAddress == answerAddress;

  @override
  int get hashCode =>
  // ignore: unnecessary_parenthesis
    (id == null ? 0 : id.hashCode) +
    (header == null ? 0 : header.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (answerAddress == null ? 0 : answerAddress.hashCode);

  @override
  String toString() => 'FeedbackDto[id=$id, header=$header, description=$description, answerAddress=$answerAddress]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (id != null) {
      json[r'id'] = id;
    }
    if (header != null) {
      json[r'header'] = header;
    }
    if (description != null) {
      json[r'description'] = description;
    }
    if (answerAddress != null) {
      json[r'answerAddress'] = answerAddress;
    }
    return json;
  }

  /// Returns a new [FeedbackDto] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeedbackDto fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();
      return FeedbackDto(
        id: mapValueOfType<String>(json, r'id'),
        header: mapValueOfType<String>(json, r'header'),
        description: mapValueOfType<String>(json, r'description'),
        answerAddress: mapValueOfType<String>(json, r'answerAddress'),
      );
    }
    return null;
  }

  static List<FeedbackDto> listFromJson(dynamic json, {bool emptyIsNull, bool growable,}) =>
    json is List && json.isNotEmpty
      ? json.map(FeedbackDto.fromJson).toList(growable: true == growable)
      : true == emptyIsNull ? null : <FeedbackDto>[];

  static Map<String, FeedbackDto> mapFromJson(dynamic json) {
    final map = <String, FeedbackDto>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) => map[key] = FeedbackDto.fromJson(value));
    }
    return map;
  }

  // maps a json object with a list of FeedbackDto-objects as value to a dart map
  static Map<String, List<FeedbackDto>> mapListFromJson(dynamic json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<FeedbackDto>>{};
    if (json is Map && json.isNotEmpty) {
      json
        .cast<String, dynamic>()
        .forEach((key, dynamic value) {
          map[key] = FeedbackDto.listFromJson(
            value,
            emptyIsNull: emptyIsNull,
            growable: growable,
          );
        });
    }
    return map;
  }
}

