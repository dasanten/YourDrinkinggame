// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_set_basic_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CardSetBasicDto extends CardSetBasicDto {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final bool? nsfw;

  factory _$CardSetBasicDto([void Function(CardSetBasicDtoBuilder)? updates]) =>
      (new CardSetBasicDtoBuilder()..update(updates)).build();

  _$CardSetBasicDto._(
      {this.id, this.name, this.description, this.category, this.nsfw})
      : super._();

  @override
  CardSetBasicDto rebuild(void Function(CardSetBasicDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardSetBasicDtoBuilder toBuilder() =>
      new CardSetBasicDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardSetBasicDto &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        nsfw == other.nsfw;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), name.hashCode), description.hashCode),
            category.hashCode),
        nsfw.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CardSetBasicDto')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('category', category)
          ..add('nsfw', nsfw))
        .toString();
  }
}

class CardSetBasicDtoBuilder
    implements Builder<CardSetBasicDto, CardSetBasicDtoBuilder> {
  _$CardSetBasicDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  bool? _nsfw;
  bool? get nsfw => _$this._nsfw;
  set nsfw(bool? nsfw) => _$this._nsfw = nsfw;

  CardSetBasicDtoBuilder() {
    CardSetBasicDto._defaults(this);
  }

  CardSetBasicDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _category = $v.category;
      _nsfw = $v.nsfw;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardSetBasicDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CardSetBasicDto;
  }

  @override
  void update(void Function(CardSetBasicDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CardSetBasicDto build() {
    final _$result = _$v ??
        new _$CardSetBasicDto._(
            id: id,
            name: name,
            description: description,
            category: category,
            nsfw: nsfw);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
