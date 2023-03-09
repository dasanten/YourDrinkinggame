import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/config/drinking_game_theme.dart';
import 'package:your_drinking_game_app/page/detail/dto/workshop_card_view.dart';
import 'package:your_drinking_game_app/page/detail/entity/local_card_view.dart';
import 'package:your_drinking_game_app/page/form/cardSet/card_set_edit_form.dart';
import 'package:your_drinking_game_app/page/form/cards/card_edit_form.dart';
import 'package:your_drinking_game_app/page/form/cards/local_card_form.dart';
import 'package:your_drinking_game_app/page/game/card_display.dart';
import 'package:your_drinking_game_app/page/menu/player_input.dart';
import 'package:your_drinking_game_app/services/update_local_workshop_cardsets.dart';
import 'package:your_drinking_game_app/services/user_service.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_set_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/current_card_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/current_workshop_card_set_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/local_card_sets_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/option_viewmodel.dart';
import 'package:your_drinking_game_app/viewmodel/workshop_card_set_viewmodel.dart';

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
        ChangeNotifierProvider<WorkshopCardSetViewModel>(
          create: (_) => WorkshopCardSetViewModel(),
        ),
        ChangeNotifierProvider<CurrentWorkshopCardSetViewmodel>(
          create: (_) => CurrentWorkshopCardSetViewmodel(),
        ),
        ChangeNotifierProvider<OptionViewModel>(
          create: (_) => OptionViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
  loadCurrentUser();
  CardSetsUtil.checkForUpdates();
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
      theme: DrinkingGameTheme.light(),
      darkTheme: DrinkingGameTheme.dark(),
      themeMode: context.watch<OptionViewModel>().themeMode,
    );
  }
}
