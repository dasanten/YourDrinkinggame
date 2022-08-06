import 'dart:math';

import 'package:flutter/cupertino.dart';
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
ValueNotifier<UserEntity?> userEntity = ValueNotifier<UserEntity?>(null);

int? get currentUserId => _currentUserId;
UserEntity? get currentUser => userEntity.value;

bool get isSignedIn => _currentUserId != null;
bool get canUseWorkshop => userEntity.value?.workshopId != null;

Future loadCurrentUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _currentUserId = sharedPreferences.getInt("user");
  if(canUseWorkshop) {
    _googleSignIn.signInSilently();
  }  
  if(currentUserId==null) {
    loginAsGuest();
  }
  if (isSignedIn) {
    userEntity.value = await getUserById(_currentUserId!);
  }

}

Future loginAsGuest() async {
  try {
    _setActiveUser(await getUser("guest"));
  } catch(e) {
    _setActiveUser(await _createUser("Gast", null));
  }
  userEntity.value = await getUserById(_currentUserId!);
}

Future loginWithGoogle() async {
  GoogleSignInAccount? account = await _googleSignIn.signIn();
  if (account != null) {
    try {
      _setActiveUser(await getUser(account.id));
    } catch(e) {
      if(e.toString().contains("User with id")) {
        _setActiveUser(await _createUser(account.displayName ?? "User" + Random().nextInt(9999).toString(), account.id));
      } else {
        throw e;
      }
    }
    userEntity.value = await getUserById(_currentUserId!);
  } else {
    throw Exception("Login abgebrochen");
  }
}

void logout() async {
  if (canUseWorkshop) {
    await _googleSignIn.signOut();
  }
  _currentUserId = null;
  userEntity.value = null;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove("user");
  sharedPreferences.remove("workshop");
}

_setActiveUser(UserEntity newUser) async {
  _currentUserId = newUser.id;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if(currentUserId != null) {
    sharedPreferences.setInt("user", _currentUserId!);
    userEntity.value = await getUserById(_currentUserId!);
  }
}

Future<UserEntity> _createUser(String username, String? workshopId) async {
  UserEntity userEntity = await insertUser(
    UserEntity(
      username: username,
      workshopId: workshopId,
    )
  );
  _insertStandardSet(userEntity.id!);
  return userEntity;
}

void _insertStandardSet(int userId) {
  insertCardSet(const CardSetEntity(workshopId: 'base-set', name: 'Standard Set', active: true, description: 'Standard Set', version: 0, nsfw: false), userId);
}



