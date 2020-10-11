import 'package:flutter/material.dart';

import 'local/cardSet/LocalCardSetsView.dart';
import 'workshop/cardSet/WorkshopCardSetsView.dart';

class CardSetsTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: TabBarView(children: [
          LocalCardSetsView(),
          WorkshopCardSetsView(),
        ]),
      ),
    );
  }
}
