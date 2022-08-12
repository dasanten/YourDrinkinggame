// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_with_card_set_role.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserWithCardSetRole extends UserWithCardSetRole {
  @override
  final String? id;
  @override
  final String? username;
  @override
  final CardSetRole? role;

  factory _$UserWithCardSetRole(
          [void Function(UserWithCardSetRoleBuilder)? updates]) =>
      (new UserWithCardSetRoleBuilder()..update(updates))._build();

  _$UserWithCardSetRole._({this.id, this.username, this.role}) : super._();

  @override
  UserWithCardSetRole rebuild(
          void Function(UserWithCardSetRoleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserWithCardSetRoleBuilder toBuilder() =>
      new UserWithCardSetRoleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserWithCardSetRole &&
        id == other.id &&
        username == other.username &&
        role == other.role;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), username.hashCode), role.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserWithCardSetRole')
          ..add('id', id)
          ..add('username', username)
          ..add('role', role))
        .toString();
  }
}

class UserWithCardSetRoleBuilder
    implements Builder<UserWithCardSetRole, UserWithCardSetRoleBuilder> {
  _$UserWithCardSetRole? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  CardSetRole? _role;
  CardSetRole? get role => _$this._role;
  set role(CardSetRole? role) => _$this._role = role;

  UserWithCardSetRoleBuilder() {
    UserWithCardSetRole._defaults(this);
  }

  UserWithCardSetRoleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _role = $v.role;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserWithCardSetRole other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserWithCardSetRole;
  }

  @override
  void update(void Function(UserWithCardSetRoleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserWithCardSetRole build() => _build();

  _$UserWithCardSetRole _build() {
    final _$result = _$v ??
        new _$UserWithCardSetRole._(id: id, username: username, role: role);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
