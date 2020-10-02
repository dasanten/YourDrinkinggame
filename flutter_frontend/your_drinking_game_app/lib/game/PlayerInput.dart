import 'package:flutter/material.dart';
import 'package:your_drinking_game_app/game/CardDisplay.dart';

class PlayerInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlayerInputState();
}

class _PlayerInputState extends State<PlayerInput> {
  TextEditingController _controller;
  final FocusNode _playerInputField = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spieler Auswahl"),
      ),
      body: Builder(
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: playerChips(),
              ),
              Container(
                padding: EdgeInsets.all(30.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Spieler Namen',
                      border: OutlineInputBorder(),
                  ),
                  controller: _controller,
                  maxLength: 10,
                  textInputAction: TextInputAction.done,
                  focusNode: _playerInputField,
                  onFieldSubmitted: (value) {
                    _playerInputField.requestFocus();
                    addPlayer();
                  },
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        child: Text("Spieler hinzufügen"),
                        onPressed: () => addPlayer(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: () => startGame(context),
                        child: Text('START!'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _players = [];

  Widget playerChips() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(_players.length, (int index) {
        return Chip(
          label: Text(_players[index]),
          onDeleted: () {
            setState(() {
              _players.removeAt(index);
            });
          },
        );
      }),
    );
  }

  void addPlayer() {
    String input = _controller.value.text.trim();
    if (input.isNotEmpty) {
      setState(() {
        _players.add(input);
      });
      _controller.text = "";
    }
  }

  void startGame(BuildContext context) {
    addPlayer();
    if (_players.length >= 2) {
      Navigator.pushNamed(context, CardDisplay.routeName, arguments: _players);
    } else {
      Scaffold.of(context).showSnackBar(notEnoughPlayerSnackBar());
    }
  }

  Widget notEnoughPlayerSnackBar() {
    return SnackBar(
      content: Text("Füge mindestens 2 Spieler hinzu"),
      behavior: SnackBarBehavior.floating,
    );
  }
}
