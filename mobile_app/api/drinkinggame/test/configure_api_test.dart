import 'package:test/test.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';


/// tests for ConfigureApi
void main() {
  final instance = DrinkinggameApi().getConfigureApi();

  group(ConfigureApi, () {
    // Changes Role of User for Cardset.
    //
    //Future<UserDto> cardSetChangeUserRole(String cardSetId, String eMail, String body) async
    test('test cardSetChangeUserRole', () async {
      // TODO
    });

    // Gets List of special Users of Cardset.
    //
    //Future<BuiltList<UserWithCardSetRole>> getCardSetSpecialUsers(String cardSetId) async
    test('test getCardSetSpecialUsers', () async {
      // TODO
    });

  });
}
