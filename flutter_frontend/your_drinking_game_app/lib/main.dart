import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'cardSetsView/CardSetsTabView.dart';
import 'cardSetsView/local/cardSet/CardSetEditForm.dart';
import 'cardSetsView/local/cards/CardEditForm.dart';
import 'cardSetsView/local/cards/LocalCardForm.dart';
import 'cardSetsView/local/cards/LocalCardView.dart';
import 'cardSetsView/workshop/cards/WorkshopCardView.dart';
import 'game/CardDisplay.dart';
import 'game/PlayerInput.dart';
import 'viewmodel/current_card_set_viewmodel.dart';
import 'viewmodel/current_card_viewmodel.dart';
import 'viewmodel/local_card_sets_viewmodel.dart';
import 'viewmodel/workshop_card_set_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LocalCardSetsViewmodel>(
          create: (_) => LocalCardSetsViewmodel(),
        ),
        ChangeNotifierProvider<CurrentCardSetViewmodel>(
          create: (_) => CurrentCardSetViewmodel(),
        ),
        ChangeNotifierProvider<CurrentCardViewmodel>(
          create: (_) => CurrentCardViewmodel(),
        ),
        ChangeNotifierProvider<WorkshopCardSetViewmodel>(
          create: (_) => WorkshopCardSetViewmodel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dein Trinkspiel',
      home: PlayerInput(),
      routes: {
        CardDisplay.routeName: (context) => CardDisplay(),
        LocalCardForm.routeName: (context) => LocalCardForm(),
        CardSetEditForm.routeName: (context) => CardSetEditForm(),
        CardEditForm.routeName: (context) => CardEditForm(),
        WorkshopCardView.routeName: (context) => WorkshopCardView(),
        LocalCardView.routeName: (context) => LocalCardView(),
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        primaryColorDark: Colors.blueAccent,
        accentColor: Colors.orangeAccent,
        buttonColor: Colors.orangeAccent,
        bottomAppBarColor: Colors.grey.shade300,
      ),
      darkTheme: ThemeData.dark(),
    );
  }
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
        // child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 5,
                child:  Image.asset(
                'assets/images/logoTransparent.jpg',
                ), 
              ),
              Flexible(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlayerInput()),
                    );
                  },
                  child: const Text('SPIELEN'),                   
                ),
              ),
              Flexible(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CardSetsTabView()),
                    );
                  },
                  child: const Text('KARTEN SETS'),
                ),
              ),
              Flexible(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('OPTIONEN'),
                ),
              ),
              Flexible(
                flex: 7,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('FEEDBACK'),
                ),
              ),
            ],
          ),
        ),
      // ),
    );
  }
}
