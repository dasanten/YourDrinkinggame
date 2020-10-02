import 'package:flutter/material.dart';

import 'package:your_drinking_game_app/cardSetsView/CardEditForm.dart';
import 'package:your_drinking_game_app/cardSetsView/CardSetEditForm.dart';
import 'package:your_drinking_game_app/cardSetsView/CardSetsTabView.dart';
import 'package:your_drinking_game_app/cardSetsView/local/cards/LocalCardForm.dart';
import 'package:your_drinking_game_app/cardSetsView/local/cards/LocalCardView.dart';
import 'package:your_drinking_game_app/game/CardDisplay.dart';
import 'game/PlayerInput.dart';

void main() {
  runApp(MaterialApp(
    title: 'Dein Trinkspiel',
    home: Menu(),
    routes: {
      CardDisplay.routeName: (context) => CardDisplay(),
      LocalCardForm.routeName: (context) => LocalCardForm(),
      CardSetEditForm.routeName: (context) => CardSetEditForm(),
      CardEditForm.routeName: (context) => CardEditForm(),
    },
    onGenerateRoute: (RouteSettings settings) {
      final routes = <String, dynamic>{
        LocalCardView.routeName: (context) => LocalCardView(settings.arguments),
      };
      WidgetBuilder builder = routes[settings.name];
      return MaterialPageRoute(builder: (context) => builder(context));
    },
    theme: ThemeData(
      primaryColor: Colors.blue,
      primaryColorDark: Colors.blueAccent,
      accentColor: Colors.orangeAccent,
      buttonColor: Colors.orangeAccent,
      bottomAppBarColor: Colors.grey.shade300,
    ),
    darkTheme: ThemeData.dark(),
  ));
}

class Menu extends StatelessWidget {
  final double menuMargin = 15;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/logoTransparent.jpg',
              width: 300,
              height: 300,
            ),
            Container(
              width: 200,
              height: 50,
              margin: EdgeInsets.all(menuMargin),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayerInput()),
                  );
                },
                child: const Text('SPIELEN'),
              ),
            ),
            Container(
              width: 200,
              height: 50,
              margin: EdgeInsets.all(menuMargin),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardSetsTabView()),
                  );
                },
                child: const Text('KARTEN SETS'),
              ),
            ),
            Container(
              width: 200,
              height: 50,
              margin: EdgeInsets.all(menuMargin),
              child: RaisedButton(
                onPressed: () {},
                child: const Text('OPTIONEN'),
              ),
            ),
            Container(
              width: 200,
              height: 50,
              margin: EdgeInsets.all(menuMargin),
              child: RaisedButton(
                onPressed: () {},
                child: const Text('FEEDBACK'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
