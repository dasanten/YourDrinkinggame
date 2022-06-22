import 'dart:math';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_drinking_game_app/data_base/repository/card_set_repository.dart';
import 'package:your_drinking_game_app/data_base/repository/user_repository.dart';

import '../data_base/model/card_set_entity.dart';
import '../data_base/model/user_entity.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: "1079576483928-26vrcobj4ogt6f1om3hgrhgavl6rsloe.apps.googleusercontent.com"
);

String _currentUserId = "";

String get currentUserId => _currentUserId;
bool get isSignedIn => _currentUserId != "";
bool get canUseWorkshop => _currentUserId != "guest" && _currentUserId != "";


void loadCurrentUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _currentUserId = sharedPreferences.get("user") as String;
}

void loginAsGuest() async {
  _setActiveUser("guest");
  try {
    await getUser("guest");
  } catch(e) {
    await _createUser("Gast", "guest");
  }
}

void loginWithGoogle() async {
  GoogleSignInAccount? account = await _googleSignIn.signIn();
  if (account != null) {
    _setActiveUser(account.id);
    try {
      await getUser(account.id);
    } catch(e) {
      if(e.toString().contains("User with id")) {
        await _createUser(account.displayName ?? "User" + Random().nextInt(9999).toString(), account.id);
      } else {
        throw e;
      }
    }
  }
}

void logout() async {
  await _googleSignIn.signOut();
}

void registerUser() async {
}

_setActiveUser(String workshopId) async {
  _currentUserId = workshopId;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("user", workshopId);
}

Future<void> _createUser(String username, String workshopId) async {
  await insertUser(
    UserEntity(
      username: username,
      workshopId: workshopId,
    )
  );
  _insertStandardSet();
}

void _insertStandardSet() {
  insertCardSet(const CardSetEntity(workshopId: 'base-set' ,name: 'Standard Set', active: true, description: 'Standard Set', version: 0, nsfw: false));
}



