import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: "1079576483928-26vrcobj4ogt6f1om3hgrhgavl6rsloe.apps.googleusercontent.com"
);

String _currentUserId = "";

String get currentUserId => _currentUserId;

void loadCurrentUser() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _currentUserId = sharedPreferences.get("user") as String;
}

void loginAsGuest() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("user", "guest");
}

void loginWithGoogle() async {
  GoogleSignInAccount? account = await _googleSignIn.signIn();
  if (account != null) {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("user", account.id);

  }
}

void logout() async {
  await _googleSignIn.signOut();
}

