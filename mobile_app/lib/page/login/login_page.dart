import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/services/user_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(isSignedIn),
      child: Scaffold(
        body: Container(
          margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: ListView(
            children: [
              Image.asset(
                'assets/images/Dein-Trinkspiel-Full.png',
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              ElevatedButton.icon(
                icon: const Icon(Icons.man),
                label: const Text("Gast"),
                onPressed: () async {
                  await loginAsGuest();
                  _navigateToHome(context);
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text("Google"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () async {
                  try {
                    await loginWithGoogle();
                    _navigateToHome(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text(e.toString().replaceFirst("Exception:", "")),
                      ),
                    );
                  }
                },
              ),
              ValueListenableBuilder(
                valueListenable: userEntity,
                builder: (context, value, child) {
                  if (isSignedIn)
                    return ElevatedButton.icon(
                      icon: const Icon(Icons.logout),
                      label: const Text("Logout"),
                      onPressed: () => logout(),
                    );
                  else
                    return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _navigateToHome(BuildContext context) => Navigator.pop(context);
}
