// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CardDto extends CardDto {
  @override
  final String? id;
  @override
  final String? content;
  @override
  final CardDto? card;
  @override
  final CardType? type;

  factory _$CardDto([void Function(CardDtoBuilder)? updates]) =>
      (new CardDtoBuilder()..update(updates))._build();

  _$CardDto._({this.id, this.content, this.card, this.type}) : super._();

  @override
  CardDto rebuild(void Function(CardDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardDtoBuilder toBuilder() => new CardDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CardDto &&
        id == other.id &&
        content == other.content &&
        card == other.card &&
        type == other.type;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), content.hashCode), card.hashCode),
        type.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CardDto')
          ..add('id', id)
          ..add('content', content)
          ..add('card', card)
          ..add('type', type))
        .toString();
  }
}

class CardDtoBuilder implements Builder<CardDto, CardDtoBuilder> {
  _$CardDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _content;
  String? get content => _$this._content;
  set content(String? content) => _$this._content = content;

  CardDtoBuilder? _card;
  CardDtoBuilder get card => _$this._card ??= new CardDtoBuilder();
  set card(CardDtoBuilder? card) => _$this._card = card;

  CardType? _type;
  CardType? get type => _$this._type;
  set type(CardType? type) => _$this._type = type;

  CardDtoBuilder() {
    CardDto._defaults(this);
  }

  CardDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _content = $v.content;
      _card = $v.card?.toBuilder();
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CardDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CardDto;
  }

  @override
  void update(void Function(CardDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CardDto build() => _build();

  _$CardDto _build() {
    _$CardDto _$result;
    try {
      _$result = _$v ??
          new _$CardDto._(
              id: id, content: content, card: _card?.build(), type: type);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'card';
        _card?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CardDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
