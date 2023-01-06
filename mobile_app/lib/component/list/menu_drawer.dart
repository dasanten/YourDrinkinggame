import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/data_base/model/user_entity.dart';
import 'package:your_drinking_game_app/page/form/feedback/feedback_page.dart';
import 'package:your_drinking_game_app/page/tab/card_sets_tab_view.dart';
import 'package:your_drinking_game_app/services/user_service.dart';

List<Widget> menuDrawer(BuildContext context) => [
      DrawerHeader(
        child: Row(
          children: [
            Icon(Icons.account_circle),
            SizedBox(width: 10),
            ValueListenableBuilder<UserEntity?>(
              builder: (context, value, child) => Text(
                '${value?.username}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              valueListenable: userEntity,
            ),
          ],
        ),
      ),
      ListTile(
        title: const Text(
          "Kartensets",
          style: TextStyle(fontSize: 17),
        ),
        trailing: const Icon(Icons.folder),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CardSetsTabView()),
        ),
      ),
      const Divider(),
      ValueListenableBuilder<UserEntity?>(
        builder: (context, value, child) => ListTile(
          title: Text(
            canUseWorkshop ? "Feedback" : "Für Feedback anmelden",
            style: TextStyle(fontSize: 17),
          ),
          trailing: const Icon(Icons.note),
          onTap: canUseWorkshop
              ? () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()),
                  )
              : null,
        ),
        valueListenable: userEntity,
      ),
      const Divider(),
      ListTile(
          title: const Text(
            "Optionen !IN DEVELOPMENT!",
            style: TextStyle(fontSize: 17),
          ),
          trailing: const Icon(Icons.settings),
          onTap: () {}),
    ];
