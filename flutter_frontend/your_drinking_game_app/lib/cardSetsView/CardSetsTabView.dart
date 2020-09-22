import 'package:flutter/material.dart';
import 'file:///D:/app/flutter_frontend/your_drinking_game_app/lib/cardSetsView/local/cardSet/LocalCardSetsView.dart';
import 'package:your_drinking_game_app/cardSetsView/workshop/WorkshopCardSetsView.dart';


class CardSetsTabView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Card Sets"),
          bottom: TabBar(
            isScrollable: false,
            tabs: [
              Tab(
                text: "Privat",
                icon: Icon(Icons.folder),
              ),
              Tab(
                text: "Workshop",
                icon: Icon(Icons.wifi),
              )
            ],
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