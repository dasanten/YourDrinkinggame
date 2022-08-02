import 'package:drinkinggame_api/drinkinggame_api.dart';

extension RoleTypePermissionExtension on CardSetRole {
  bool get canUpdate => this == CardSetRole.OWNER || this == CardSetRole.ADMIN;
  bool get canDelete => this == CardSetRole.OWNER;
}