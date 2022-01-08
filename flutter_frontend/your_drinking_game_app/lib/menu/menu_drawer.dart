import 'package:flutter/material.dart';

import 'card_set_lists/card_sets_tab_view.dart';

List<Widget> menuDrawer(BuildContext context) =>  [
  DrawerHeader(
    decoration: const BoxDecoration(
      color: Color.fromRGBO(0, 0, 0, 0.1),
    ),
    child: Image.asset(
      'assets/images/Dein-Trinkspiel-Full.png',
    ),     
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