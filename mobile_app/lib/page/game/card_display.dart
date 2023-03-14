import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/component/bottom_sheet/player_bottom_sheet.dart';

import '../../viewmodel/game_view_model.dart';

class CardDisplay extends StatelessWidget {
  static const routeName = '/CardDisplay';

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, value, child) => GestureDetector(
        onTap: () => _pickCard(context),
        child: ColoredBox(
          color: value.currentColor,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    Positioned(right: 0, child: _editPlayer(context)),
                    Align(
                      child: _displayedCardView(
                        content: value.cardTextWithNames,
                        title: value.cardTitle,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget _editPlayer(BuildContext context) => Padding(
        padding: EdgeInsets.all(10),
        child: IconButton(
          iconSize: 50,
          icon: Icon(
            Icons.person_add_rounded,
            color: Colors.white,
          ),
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (_) => PlayerBottomSheet(),
          ),
        ),
      );

  Widget _displayedCardView({required String content, String? title}) =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Text(
                title,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      );

  Future _pickCard(BuildContext context) async {
    try {
      await context.read<GameViewModel>().pickCard();
    } catch (e) {
      Navigator.pop(context);
    }
  }
}
