import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/game/CardDisplay.dart';
import 'game/PlayerInput.dart';

void main() {
  runApp(MaterialApp(
    title: 'Dein Trinkspiel',
    home: Menu(),
    routes: {
      CardDisplay.routeName: (context) => CardDisplay(),
    },
    theme: ThemeData(
      primaryColor: Colors.blue,
      primaryColorDark: Colors.blueAccent,
      accentColor: Colors.orangeAccent,
      buttonColor: Colors.orangeAccent,
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
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'images/logoTransparent.jpg',
              width: 300,
              height: 300,
            ),
            Container(
              width: 200,
              height: 50,
              margin: EdgeInsets.all(menuMargin),
              child: RaisedButton(
                child: Text('Spielen'.toUpperCase()),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayerInput()),
                  );
                },
              ),
            ),
            Container(
                width: 200,
                height: 50,
                margin: EdgeInsets.all(menuMargin),
                child: RaisedButton(
                  child: Text('Karten Sets'.toUpperCase()),
                  onPressed: () {},
                )
            ),
            Container(
                width: 200,
                height: 50,
                margin: EdgeInsets.all(menuMargin),
                child: RaisedButton(
                  child: Text('Optionen'.toUpperCase()),
                  onPressed: () {},
                )
            ),
            Container(
                width: 200,
                height: 50,
                margin: EdgeInsets.all(menuMargin),
                child: RaisedButton(
                  child: Text('Feedback'.toUpperCase()),
                  onPressed: () {},
                )
            ),
          ],
        ),
      )
    );
  }
}
