// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDto extends UserDto {
  @override
  final String? id;
  @override
  final String? username;
  @override
  final String? eMail;
  @override
  final UserRole? role;

  factory _$UserDto([void Function(UserDtoBuilder)? updates]) =>
      (new UserDtoBuilder()..update(updates)).build();

  _$UserDto._({this.id, this.username, this.eMail, this.role}) : super._();

  @override
  UserDto rebuild(void Function(UserDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDtoBuilder toBuilder() => new UserDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDto &&
        id == other.id &&
        username == other.username &&
        eMail == other.eMail &&
        role == other.role;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), username.hashCode), eMail.hashCode),
        role.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDto')
          ..add('id', id)
          ..add('username', username)
          ..add('eMail', eMail)
          ..add('role', role))
        .toString();
  }
}

class UserDtoBuilder implements Builder<UserDto, UserDtoBuilder> {
  _$UserDto? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _eMail;
  String? get eMail => _$this._eMail;
  set eMail(String? eMail) => _$this._eMail = eMail;

  UserRole? _role;
  UserRole? get role => _$this._role;
  set role(UserRole? role) => _$this._role = role;

  UserDtoBuilder() {
    UserDto._defaults(this);
  }

  UserDtoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _eMail = $v.eMail;
      _role = $v.role;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDto other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDto;
  }

  @override
  void update(void Function(UserDtoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDto build() {
    final _$result = _$v ??
        new _$UserDto._(id: id, username: username, eMail: eMail, role: role);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
