import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:your_drinking_game_app/data_base/repository/card_set_repository.dart';
import 'package:your_drinking_game_app/data_base/repository/user_repository.dart';
import 'package:your_drinking_game_app/viewmodel/local_card_sets_viewmodel.dart';

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
  _currentUserId = sharedPreferences.getInt("user");
  _currentWorkshopId = sharedPreferences.getString("workshop");
}

void loginAsGuest(BuildContext context) async {
  try {
    _setActiveUser(await getUser("guest"), context);
  } catch(e) {
    await _createUser("Gast", "guest", context);
  }
}

Future loginWithGoogle(BuildContext context) async {
  GoogleSignInAccount? account = await _googleSignIn.signIn();
  if (account != null) {
    try {
      _setActiveUser(await getUser(account.id), context);
    } catch(e) {
      if(e.toString().contains("User with id")) {
        await _createUser(account.displayName ?? "User" + Random().nextInt(9999).toString(), account.id, context);
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

_setActiveUser(UserEntity userEntity, BuildContext context) async {
  _currentUserId = userEntity.id;
  _currentWorkshopId = userEntity.workshopId;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if(currentUserId != null) {
    sharedPreferences.setInt("user", _currentUserId!);
  }
  if(currentWorkshopId != null) {
    sharedPreferences.setString("workshop", _currentWorkshopId!);
  }
  context.read<LocalCardSetsViewmodel>().getCardSets();
}

Future<void> _createUser(String username, String workshopId, BuildContext context) async {
  UserEntity userEntity = await insertUser(
    UserEntity(
      username: username,
      workshopId: workshopId,
    )
  );
  _insertStandardSet(userEntity.id!, context);
}

void _insertStandardSet(int userId, BuildContext context) {
  insertCardSet(const CardSetEntity(workshopId: 'base-set' ,name: 'Standard Set', active: true, description: 'Standard Set', version: 0, nsfw: false), userId);
  context.read<LocalCardSetsViewmodel>().getCardSets();
}



