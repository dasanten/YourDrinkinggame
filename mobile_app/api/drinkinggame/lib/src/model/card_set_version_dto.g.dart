// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_set_version_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CardSetVersionDto extends CardSetVersionDto {
  @override
  final String? id;
  @override
  final num? version;

  factory _$CardSetVersionDto(
          [void Function(CardSetVersionDtoBuilder)? updates]) =>
      (new CardSetVersionDtoBuilder()..update(updates)).build();

  _$CardSetVersionDto._({this.id, this.version}) : super._();

  @override
  CardSetVersionDto rebuild(void Function(CardSetVersionDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardSetVersionDtoBuilder toBuilder() =>
      new CardSetVersionDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardSetVersionDto &&
        id == other.id &&
        version == other.version;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), version.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CardSetVersionDto')
          ..add('id', id)
          ..add('version', version))
        .toString();
  }
}

class CardSetVersionDtoBuilder
    implements Builder<CardSetVersionDto, CardSetVersionDtoBuilder> {
  _$CardSetVersionDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  num? _version;
  num? get version => _$this._version;
  set version(num? version) => _$this._version = version;

  CardSetVersionDtoBuilder() {
    CardSetVersionDto._defaults(this);
  }

  CardSetVersionDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _version = $v.version;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardSetVersionDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CardSetVersionDto;
  }

  @override
  void update(void Function(CardSetVersionDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CardSetVersionDto build() {
    final _$result = _$v ?? new _$CardSetVersionDto._(id: id, version: version);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
