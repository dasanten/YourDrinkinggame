
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/models/CardEntity.dart';

import 'cardSetsView/CardSetsTabView.dart';
import 'cardSetsView/local/cardSet/CardSetEditForm.dart';
import 'cardSetsView/local/cards/CardEditForm.dart';
import 'cardSetsView/local/cards/LocalCardForm.dart';
import 'cardSetsView/local/cards/LocalCardView.dart';
import 'cardSetsView/workshop/cards/WorkshopCardView.dart';
import 'dataBase/CardSetDB.dart';
import 'game/CardDisplay.dart';
import 'game/PlayerInput.dart';
import 'http_service/CardSetService.dart';
import 'http_service/dto/CardSetDto.dart';
import 'http_service/dto/card_set_version_dto.dart';
import 'models/CardSetEntity.dart';
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
  checkForUpdates();
}

Future checkForUpdates() async {
  // Get local CardSets
  final List<CardSetEntity> cardSetList = await CardSetDB.cardSetDB.getCardSets();

  // Workshop CardSets
  cardSetList.removeWhere((element) => element.workshopId?.isEmpty ?? true);
  final List<CardSetVersionDto> cardSetVersionList = cardSetList.map<CardSetVersionDto>((e) => CardSetVersionDto.fromCardEntity(e)).toList();
  List<CardSetDto> newCardSets = await CardSetService.checkCardSetUpdates(cardSetVersionList);

  // itterate newCardSets
  newCardSets.forEach((newCardSet) async {
    // Find correspondig saved CardSet and copy with changes
    final CardSetEntity cardSet = cardSetList.firstWhere((element) => element.workshopId==newCardSet.id).copyWith(name: newCardSet.name, description: newCardSet.description, version: newCardSet.version);

    // Save changed CardSet
    CardSetDB.cardSetDB.updateCardSet(cardSet);

    // List of old Local Cards
    List<CardEntity> oldCards = await CardSetDB.cardSetDB.getCards(cardSet.id!);

    final List<CardEntity> removeCards = List.from(oldCards);

    // Itterate threw Cards to find corresponding
    newCardSet.cardList.forEach((newCard) {
      bool added = false;
      for (final CardEntity dbCard in oldCards) {
        if(dbCard.workshopId == newCard.id) {
          removeCards.remove(dbCard);
          CardSetDB.cardSetDB.updateCard(dbCard.copyWith(content: newCard.content));
          added = true;
          break;
        } 
      }
      if(!added) {
        CardSetDB.cardSetDB.insertCard(CardEntity.fromCardDto(newCard, cardSet.id!));
      }
    });

    removeCards.forEach((card) { CardSetDB.cardSetDB.deleteCard(card.id!); });    
  });
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
        colorScheme: ColorScheme.fromSwatch(

        ),
        textTheme: GoogleFonts.ubuntuTextTheme(),
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
                  'assets/images/Dein-Trinkspiel-Full.png',
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
