import 'package:drinkinggame_api/drinkinggame_api.dart';

extension RoleTypePermissionExtension on CardSetRole {
  bool get canUpdateCard => this == CardSetRole.OWNER || this == CardSetRole.ADMIN;
  bool get canUpdateCardSet => this == CardSetRole.OWNER || this == CardSetRole.ADMIN;
}