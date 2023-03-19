// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FeedbackDto extends FeedbackDto {
  @override
  final String? id;
  @override
  final String? header;
  @override
  final String? description;
  @override
  final String? answerAddress;

  factory _$FeedbackDto([void Function(FeedbackDtoBuilder)? updates]) =>
      (new FeedbackDtoBuilder()..update(updates)).build();

  _$FeedbackDto._({this.id, this.header, this.description, this.answerAddress})
      : super._();

  @override
  FeedbackDto rebuild(void Function(FeedbackDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeedbackDtoBuilder toBuilder() => new FeedbackDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeedbackDto &&
        id == other.id &&
        header == other.header &&
        description == other.description &&
        answerAddress == other.answerAddress;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), header.hashCode), description.hashCode),
        answerAddress.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FeedbackDto')
          ..add('id', id)
          ..add('header', header)
          ..add('description', description)
          ..add('answerAddress', answerAddress))
        .toString();
  }
}

class FeedbackDtoBuilder implements Builder<FeedbackDto, FeedbackDtoBuilder> {
  _$FeedbackDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _header;
  String? get header => _$this._header;
  set header(String? header) => _$this._header = header;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _answerAddress;
  String? get answerAddress => _$this._answerAddress;
  set answerAddress(String? answerAddress) =>
      _$this._answerAddress = answerAddress;

  FeedbackDtoBuilder() {
    FeedbackDto._defaults(this);
  }

  FeedbackDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _header = $v.header;
      _description = $v.description;
      _answerAddress = $v.answerAddress;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeedbackDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FeedbackDto;
  }

  @override
  void update(void Function(FeedbackDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FeedbackDto build() {
    final _$result = _$v ??
        new _$FeedbackDto._(
            id: id,
            header: header,
            description: description,
            answerAddress: answerAddress);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
