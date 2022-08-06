// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_basic_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserBasicDto extends UserBasicDto {
  @override
  final String? id;
  @override
  final String? username;

  factory _$UserBasicDto([void Function(UserBasicDtoBuilder)? updates]) =>
      (new UserBasicDtoBuilder()..update(updates)).build();

  _$UserBasicDto._({this.id, this.username}) : super._();

  @override
  UserBasicDto rebuild(void Function(UserBasicDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBasicDtoBuilder toBuilder() => new UserBasicDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserBasicDto &&
        id == other.id &&
        username == other.username;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), username.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserBasicDto')
          ..add('id', id)
          ..add('username', username))
        .toString();
  }
}

class UserBasicDtoBuilder
    implements Builder<UserBasicDto, UserBasicDtoBuilder> {
  _$UserBasicDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  UserBasicDtoBuilder() {
    UserBasicDto._defaults(this);
  }

  UserBasicDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserBasicDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserBasicDto;
  }

  @override
  void update(void Function(UserBasicDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserBasicDto build() {
    final _$result = _$v ?? new _$UserBasicDto._(id: id, username: username);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
