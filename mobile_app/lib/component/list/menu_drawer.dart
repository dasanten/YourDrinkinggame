import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/page/tab/card_sets_tab_view.dart';
import 'package:your_drinking_game_app/services/user_service.dart';


List<Widget> menuDrawer(BuildContext context) =>  [
  DrawerHeader(
    child: Row(
      children: [
          Icon(Icons.account_circle),
          SizedBox(width: 10),
          ValueListenableBuilder(
            builder: (context, value, child) => Text(
              '${currentUser?.username}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            valueListenable: userEntity,
          ),
        ],
    )
  ),
  ListTile(
    title: const Text("Kartensets",
      style: TextStyle(
        fontSize: 17
      ),),
    trailing: const Icon(Icons.folder),
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
      builder: (context) => CardSetsTabView()),
    ),
  ),
  const Divider(),
  ListTile(
    title: const Text("Feedback !IN DEVELOPMENT!",
      style: TextStyle(
        fontSize: 17
      ),
    ),
    trailing: const Icon(Icons.note),
    onTap: () {}
  ),
  const Divider(),
  ListTile(
    title: const Text("Optionen !IN DEVELOPMENT!",
      style: TextStyle(
        fontSize: 17
      ),),
    trailing: const Icon(Icons.settings),
    onTap: () {}
  ),
];