// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_set_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CardSetDto extends CardSetDto {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final num? version;
  @override
  final bool? nsfw;
  @override
  final UserBasicDto? creator;
  @override
  final BuiltList<CardDto>? cards;

  factory _$CardSetDto([void Function(CardSetDtoBuilder)? updates]) =>
      (new CardSetDtoBuilder()..update(updates))._build();

  _$CardSetDto._(
      {this.id,
      this.name,
      this.description,
      this.category,
      this.version,
      this.nsfw,
      this.creator,
      this.cards})
      : super._();

  @override
  CardSetDto rebuild(void Function(CardSetDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardSetDtoBuilder toBuilder() => new CardSetDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardSetDto &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        category == other.category &&
        version == other.version &&
        nsfw == other.nsfw &&
        creator == other.creator &&
        cards == other.cards;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), name.hashCode),
                            description.hashCode),
                        category.hashCode),
                    version.hashCode),
                nsfw.hashCode),
            creator.hashCode),
        cards.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CardSetDto')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('category', category)
          ..add('version', version)
          ..add('nsfw', nsfw)
          ..add('creator', creator)
          ..add('cards', cards))
        .toString();
  }
}

class CardSetDtoBuilder implements Builder<CardSetDto, CardSetDtoBuilder> {
  _$CardSetDto? _$v;

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

  num? _version;
  num? get version => _$this._version;
  set version(num? version) => _$this._version = version;

  bool? _nsfw;
  bool? get nsfw => _$this._nsfw;
  set nsfw(bool? nsfw) => _$this._nsfw = nsfw;

  UserBasicDtoBuilder? _creator;
  UserBasicDtoBuilder get creator =>
      _$this._creator ??= new UserBasicDtoBuilder();
  set creator(UserBasicDtoBuilder? creator) => _$this._creator = creator;

  ListBuilder<CardDto>? _cards;
  ListBuilder<CardDto> get cards =>
      _$this._cards ??= new ListBuilder<CardDto>();
  set cards(ListBuilder<CardDto>? cards) => _$this._cards = cards;

  CardSetDtoBuilder() {
    CardSetDto._defaults(this);
  }

  CardSetDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _category = $v.category;
      _version = $v.version;
      _nsfw = $v.nsfw;
      _creator = $v.creator?.toBuilder();
      _cards = $v.cards?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardSetDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CardSetDto;
  }

  @override
  void update(void Function(CardSetDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CardSetDto build() => _build();

  _$CardSetDto _build() {
    _$CardSetDto _$result;
    try {
      _$result = _$v ??
          new _$CardSetDto._(
              id: id,
              name: name,
              description: description,
              category: category,
              version: version,
              nsfw: nsfw,
              creator: _creator?.build(),
              cards: _cards?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'creator';
        _creator?.build();
        _$failedField = 'cards';
        _cards?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CardSetDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
