import 'package:flutter/material.dart';
import 'game/PlayerInput.dart';

void main() {
  runApp(MaterialApp(
    title: 'Dein Trinkspiel',
    theme: ThemeData(
      primaryColor: Colors.blue,
      primaryColorDark: Colors.blueAccent,
      accentColor: Colors.orangeAccent,
      buttonColor: Colors.orangeAccent,
    ),
    darkTheme: ThemeData.dark(),
    home: Menu(),
  ));
}

class Menu extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('START'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayerInput()),
                );
              },
            ),
            RaisedButton(
              child: Text('KARTEN SETS'),
              onPressed: () {},
            )
          ],
        ),
      )
    );
  }
}
