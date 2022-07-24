import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/page/menu/player_input.dart';
import 'package:your_drinking_game_app/services/user_service.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    _navigateIfSignedIn(context);
    return Scaffold(
      body: Container(
        margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/Dein-Trinkspiel-Full.png',
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10)
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.man),
              label: const Text("Gast"),
              onPressed: () async { 
                await loginAsGuest(context); 
                _navigateToHome(context);
                }, 
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text("Google"),
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () async {
                await loginWithGoogle(context);
                _navigateToHome( context);
              },
            ),
          ],
        ),
      ),      
    );     
  }

  _navigateToHome(BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => PlayerInput()),
  );

  _navigateIfSignedIn(BuildContext context) async {
    if (!isSignedIn) {
      await loadCurrentUser();
    }
    if (isSignedIn) {
      _navigateToHome(context);
    }
  }
  
}