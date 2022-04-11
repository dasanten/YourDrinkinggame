import 'package:test/test.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';


/// tests for ModerratingApi
void main() {
  final instance = DrinkinggameApi().getModerratingApi();

  group(ModerratingApi, () {
    // Bans User.
    //
    //Future<UserDto> banUser(String userId) async
    test('test banUser', () async {
      // TODO
    });

    // Gets all currently banned Users
    //
    //Future<BuiltList<UserDto>> getBannedUsers() async
    test('test getBannedUsers', () async {
      // TODO
    });

    // Remove Card as Moderator.
    //
    //Future modRemoveCard(String cardId) async
    test('test modRemoveCard', () async {
      // TODO
    });

    // Remove Cardset as Moderator.
    //
    //Future modRemoveCardSet(String cardSetId) async
    test('test modRemoveCardSet', () async {
      // TODO
    });

    // Changes User role.
    //
    //Future<UserDto> setUserRole(String eMail, String body) async
    test('test setUserRole', () async {
      // TODO
    });

    // Unbans User.
    //
    //Future<UserDto> unbanUser(String userId) async
    test('test unbanUser', () async {
      // TODO
    });

  });
}
