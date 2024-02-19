import 'package:flutter/material.dart';

import '../list/dto/workshop_card_sets_view.dart';
import '../list/entity/local_card_sets_view.dart';
import '../menu/menu_page.dart';

class CardSetsTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: menuNavigationBar(context),
        appBar: AppBar(
          title: const Text("Card Sets"),
          bottom: const TabBar(
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
          ],
        ),
      ),
    );
  }
}
