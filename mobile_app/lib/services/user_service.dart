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

int? _currentUserId;
String? _currentWorkshopId;

int? get currentUserId => _currentUserId;
String? get currentWorkshopId => _currentWorkshopId;

bool get isSignedIn => _currentUserId != null;
bool get canUseWorkshop => _currentWorkshopId != null;


void loadCurrentUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _currentUserId = sharedPreferences.get("user") as int?;
}

void loginAsGuest() async {
  try {
  _setActiveUser(await getUser("guest"));
  } catch(e) {
    await _createUser("Gast", "guest");
  }
}

void loginWithGoogle() async {
  GoogleSignInAccount? account = await _googleSignIn.signIn();
  if (account != null) {
    try {
      _setActiveUser(await getUser(account.id));
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

_setActiveUser(UserEntity userEntity) async {
  _currentUserId = userEntity.id;
  _currentWorkshopId = userEntity.workshopId;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("user", userEntity.id.toString());
}

Future<void> _createUser(String username, String workshopId) async {
  UserEntity userEntity = await insertUser(
    UserEntity(
      username: username,
      workshopId: workshopId,
    )
  );
  _insertStandardSet(userEntity.id!);
}

void _insertStandardSet(int userId) {
  insertCardSet(const CardSetEntity(workshopId: 'base-set' ,name: 'Standard Set', active: true, description: 'Standard Set', version: 0, nsfw: false), userId);
}



