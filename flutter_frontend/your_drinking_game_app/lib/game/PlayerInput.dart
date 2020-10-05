import 'package:flutter/material.dart';

import 'CardDisplay.dart';

class PlayerInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlayerInputState();
}

class _PlayerInputState extends State<PlayerInput> {
  final FocusNode _playerInputField = FocusNode();
  final List<String> _players = [];
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spieler Auswahl"),
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
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  decoration: const InputDecoration(
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
                      padding: const EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: addPlayer,
                        child: const Text("Spieler hinzufügen"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: RaisedButton(
                        onPressed: () => startGame(context),
                        child: const Text('START!'),
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

  Widget playerChips() {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(
        _players.length,
        (index) {
          return Chip(
            label: Text(_players[index]),
            onDeleted: () {
              setState(() {
                _players.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }

  void addPlayer() {
    final input = _controller.value.text.trim();
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
      Scaffold.of(context).showSnackBar(
        const SnackBar(
          content: Text("Füge mindestens 2 Spieler hinzu"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
