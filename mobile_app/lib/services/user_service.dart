import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_drinking_game_app/data_base/repository/card_set_repository.dart';
import 'package:your_drinking_game_app/data_base/repository/user_repository.dart';
import 'package:your_drinking_game_app/openapi/api_client.dart';

import '../data_base/model/card_set_entity.dart';
import '../data_base/model/user_entity.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      "1079576483928-26vrcobj4ogt6f1om3hgrhgavl6rsloe.apps.googleusercontent.com",
  scopes: [
    'openid',
    'profile',
    'email',
  ],
);

int? _currentUserId;
String? _authToken;
ValueNotifier<UserEntity?> userEntity = ValueNotifier<UserEntity?>(null);

int? get currentUserId => _currentUserId;
UserEntity? get currentUser => userEntity.value;

bool get isSignedIn => _currentUserId != null;
bool get canUseWorkshop => userEntity.value?.workshopId != null;

String? get authToken => _authToken;

Future<void> setAuthToken(GoogleSignInAccount? account) async {
  print(account);
  _authToken = (await account?.authentication)?.idToken;
  print(authToken);
}

Future loadCurrentUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _currentUserId = sharedPreferences.getInt("user");
  if (isSignedIn) {
    userEntity.value = await getUserById(_currentUserId!);
  }
  if (canUseWorkshop) {
    await setAuthToken(await _googleSignIn.signInSilently());
  }
  if (currentUserId == null) {
    loginAsGuest();
  }
}

Future loginAsGuest() async {
  try {
    _setActiveUser(await getUser("guest"));
  } catch (e) {
    _setActiveUser(await _createUser("Gast", null));
  }
  userEntity.value = await getUserById(_currentUserId!);
}

Future loginWithGoogle() async {
  GoogleSignInAccount? account = await _googleSignIn.signIn();
  await setAuthToken(account);
  if (account != null) {
    try {
      _setActiveUser(await getUser(account.id));
    } catch (e) {
      if (e.toString().contains("User with id")) {
        _setActiveUser(await _createUser(
            account.displayName ?? "User" + Random().nextInt(9999).toString(),
            account.id));
      } else {
        throw e;
      }
    }
    userEntity.value = await getUserById(_currentUserId!);
    _backendLogin();
  } else {
    throw Exception("Login abgebrochen");
  }
}

Future<void> _backendLogin() async {
  try {
    await api.getAuthApi().login();
  } catch (e) {
    try {
      if (e is DioError && e.type == DioErrorType.response) {
        await api.getAuthApi().register(
            username: userEntity.value?.username ??
                "User" + Random().nextInt(9999).toString());
      } else {
        throw e;
      }
    } catch (e) {
      print(e);
    }
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
  if (currentUserId != null) {
    sharedPreferences.setInt("user", _currentUserId!);
    userEntity.value = await getUserById(_currentUserId!);
  }
}

Future<UserEntity> _createUser(String username, String? workshopId) async {
  UserEntity userEntity = await insertUser(UserEntity(
    username: username,
    workshopId: workshopId,
  ));
  _insertStandardSet(userEntity.id!);
  return userEntity;
}

void _insertStandardSet(int userId) {
  insertCardSet(
      const CardSetEntity(
          workshopId: 'base-set',
          name: 'Standard Set',
          active: true,
          description: 'Standard Set',
          version: 0,
          nsfw: false),
      userId);
}
