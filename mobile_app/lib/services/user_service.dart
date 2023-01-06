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

ValueNotifier<UserEntity?> userEntity = ValueNotifier<UserEntity?>(null)
  ..addListener(() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isSignedIn) {
      sharedPreferences.setInt("user", currentUserId!);
    }
  });

UserEntity? get currentUser => userEntity.value;

int? get currentUserId => userEntity.value?.id;

bool get isSignedIn => currentUserId != null;

bool get canUseWorkshop => userEntity.value?.workshopId != null;

Future<void> setAuthToken(GoogleSignInAccount? account) async {
  var authToken = (await account?.authentication)?.idToken;
  updateAuthToken(authToken);
}

Future<void> loadCurrentUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var user = sharedPreferences.getInt("user");
  if (user != null) {
    userEntity.value = await getUserById(user);
  } else {
    loginAsGuest();
  }
  if (canUseWorkshop) {
    await setAuthToken(await _googleSignIn.signInSilently());
  }
}

Future<void> loginAsGuest() async {
  try {
    userEntity.value = await getUserById(-1);
  } catch (e) {
    userEntity.value = await _createUser("Gast", id: -1);
  }
}

Future<void> loginWithGoogle() async {
  GoogleSignInAccount? account = await _googleSignIn.signIn();
  await setAuthToken(account);
  if (account != null) {
    try {
      userEntity.value = await getUser(account.id);
    } catch (e) {
      if (e.toString().contains("User with id")) {
        userEntity.value = await _createUser(
            account.displayName ?? "User" + Random().nextInt(9999).toString(),
            workshopId: account.id);
      } else {
        throw e;
      }
    }
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

Future<void> logout() async {
  if (canUseWorkshop) {
    await _googleSignIn.signOut();
  }
  userEntity.value = null;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove("user");
}

Future<UserEntity> _createUser(String username,
    {String? workshopId, int? id}) async {
  UserEntity userEntity = await insertUser(UserEntity(
    id: id,
    username: username,
    workshopId: workshopId,
  ));
  await _insertStandardSet(userEntity.id!);
  return userEntity;
}

Future<void> _insertStandardSet(int userId) async {
  await insertCardSet(
    const CardSetEntity(
      workshopId: 'base-set',
      name: 'Standard Set',
      active: true,
      description: 'Standard Set',
      version: 0,
      nsfw: false,
    ),
    userId,
  );
}
