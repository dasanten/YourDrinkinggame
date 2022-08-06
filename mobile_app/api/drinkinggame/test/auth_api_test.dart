import 'package:test/test.dart';
import 'package:drinkinggame_api/drinkinggame_api.dart';


/// tests for AuthApi
void main() {
  final instance = DrinkinggameApi().getAuthApi();

  group(AuthApi, () {
    // changes Username
    //
    //Future<String> changeUsername(String username) async
    test('test changeUsername', () async {
      // TODO
    });

    // checks if user does exist
    //
    //Future<String> login() async
    test('test login', () async {
      // TODO
    });

    // Registers new User
    //
    //Future register(String username) async
    test('test register', () async {
      // TODO
    });

  });
}
