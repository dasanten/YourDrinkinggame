import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/cardSetsView/local/LocalCardSetsView.dart';
import 'package:your_drinking_game_app/cardSetsView/workshop/WorkshopCardSetsView.dart';


class CardSetsTabView extends StatelessWidget {

  final tabs = [
    "Local",
    "Workshop",
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Card Sets"),
          bottom: TabBar(
            isScrollable: false,
            tabs: [ for (final tab in tabs) Tab(text: tab,) ],
          ),
        ),
        body: TabBarView(
            children: [
              LocalCardSetsView(),
              WorkshopCardSetsView(),
            ]
        ),
      ),
    );
  }

}