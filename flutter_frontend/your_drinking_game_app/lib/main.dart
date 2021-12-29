
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'cardSetsView/local/cardSet/card_set_edit_form.dart';
import 'cardSetsView/local/cards/card_edit_form.dart';
import 'cardSetsView/local/cards/local_card_form.dart';
import 'cardSetsView/local/cards/local_card_view.dart';
import 'cardSetsView/workshop/cards/workshop_card_view.dart';
import 'menu/game/card_display.dart';
import 'menu/player_input.dart';
import 'services/update_local_workshop_cardsets.dart';
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
  checkForUpdatedCardSets();
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
        bottomAppBarColor: Colors.grey.shade300,
        textTheme: GoogleFonts.ubuntuTextTheme(), colorScheme: ColorScheme.fromSwatch(

        ).copyWith(secondary: Colors.orangeAccent),
      ),
      darkTheme: ThemeData.dark(),
    );
  }
}

