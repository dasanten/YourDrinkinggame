import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_drinking_game_app/viewmodel/game_view_model.dart';

class PlayerBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: Text(
                "Spieler Liste",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _addPlayerCard(context),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => _playerCard(
                context: context,
                player: value.players[index],
                deletePlayer: () => context
                    .read<GameViewModel>()
                    .removePlayer(value.players[index]),
                removeAble: value.players.length > 2,
              ),
              itemCount: value.players.length,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _cardWrapper({required Widget child}) => SizedBox(
        height: 66,
        child: Card(
          child: Padding(padding: const EdgeInsets.all(8.0), child: child),
        ),
      );

  Widget _playerCard({
    required BuildContext context,
    required String player,
    required void Function() deletePlayer,
    required bool removeAble,
  }) =>
      _cardWrapper(
        child: Row(
          children: [
            Expanded(
              child: Text(
                player,
                style: TextStyle(
                  fontSize: 20,
                ),
                textScaleFactor: 1.7,
              ),
            ),
            FloatingActionButton(
              onPressed: removeAble
                  ? deletePlayer
                  : () => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Es müssen mindesten 2 Spieler im Spiel bleiben",
                          ),
                        ),
                      ),
              child:
                  Icon(removeAble ? Icons.delete : Icons.delete_forever_sharp),
              backgroundColor:
                  !removeAble ? Theme.of(context).errorColor : null,
            ),
          ],
        ),
      );

  Widget _addPlayerCard(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return _cardWrapper(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: textEditingController,
              onFieldSubmitted: (name) => name.isNotEmpty
                  ? context.read<GameViewModel>().addPlayer(name)
                  : null,
              validator: (value) =>
                  value?.isEmpty ?? true ? "Bitte gebe eienen Namen ein" : null,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              if (textEditingController.value.text.isNotEmpty) {
                context
                    .read<GameViewModel>()
                    .addPlayer(textEditingController.value.text);
              }
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
